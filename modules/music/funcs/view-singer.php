<?php

/**
 * @Project NUKEVIET MUSIC 4.X
 * @Author PHAN TAN DUNG (phantandung92@gmail.com)
 * @Copyright (C) 2016 PHAN TAN DUNG. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate Sun, 26 Feb 2017 14:04:32 GMT
 */

if (!defined('NV_IS_MOD_MUSIC'))
    die('Stop!!!');

$page_title = $module_info['custom_title'];

$data_singer = array();
$request_artist_alias = '';
$request_tab = '';
$page = 1;

if (isset($array_op[1])) {
    if (preg_match("/^([a-zA-Z0-9\-]+)\-" . nv_preg_quote($global_array_config['code_prefix']['singer']) . "([a-zA-Z0-9\-]+)$/", $array_op[1], $m)) {
        $data_singer = nv_get_artists($m[2], true, true);
        $request_artist_alias = $m[1];
    }
}

if (empty($data_singer)) {
    header('Location: ' . nv_url_rewrite(NV_MOD_LINK, true));
    die();
}

// Các tab
if (isset($array_op[2])) {
    foreach ($global_array_config['view_singer_tabs_alias'] as $tab_key => $tab_alias) {
        if ($tab_alias == $array_op[2]) {
            $request_tab = $tab_key;
            break;
        }
    }
    if (empty($request_tab)) {
        header('Location: ' . nv_url_rewrite(nv_get_view_singer_link($data_singer, false), true));
        die();
    }
}

// Phân trang
if (isset($array_op[3])) {
    if (preg_match("/^page\-([0-9]{1,7})$/", $array_op[3], $m)) {
        $page = intval($m[1]);
    }
    if ($page <= 1) {
        header('Location: ' . nv_url_rewrite(nv_get_view_singer_link($data_singer, false, $request_tab), true));
        die();
    }
}

// Chỉnh lại đường dẫn nếu Alias thay đổi hoặc đặt page sai
if (isset($array_op[4]) or $data_singer['artist_alias'] != $request_artist_alias or (empty($request_tab) and $_SERVER['REQUEST_URI'] != nv_url_rewrite(nv_get_view_singer_link($data_singer, false), true))) {
    header('Location: ' . nv_url_rewrite(nv_get_view_singer_link($data_singer, false, $request_tab), true));
    die();
}

$base_url = nv_get_view_singer_link($data_singer, true, $request_tab);
$all_pages = 0;
$per_page = 1;

$array_songs = $array_videos = $array_albums = array();
$array_singers = $array_singer_ids = array();

// Lấy các album
if (empty($request_tab) or $request_tab == 'album') {
    $per_page = empty($request_tab) ? $global_array_config['view_singer_main_num_albums'] : $global_array_config['view_singer_detail_num_albums'];
    $db->sqlreset()->from(NV_MOD_TABLE . "_albums")->where("is_official=1 AND status=1 AND FIND_IN_SET(" . $data_singer['artist_id'] . ", singer_ids)");
    
    if (!empty($request_tab)) {
        $db->select("COUNT(*)");
        $all_pages = $db->query($db->sql())->fetchColumn();
    }

    $array_select_fields = nv_get_album_select_fields();
    $db->order("album_id DESC")->offset(($page - 1) * $per_page)->limit($per_page);    
    $db->select(implode(', ', $array_select_fields[0]));
    
    $result = $db->query($db->sql());
    while ($row = $result->fetch()) {
        foreach ($array_select_fields[1] as $f) {
            if (empty($row[$f]) and !empty($row['default_' . $f])) {
                $row[$f] = $row['default_' . $f];
            }
            unset($row['default_' . $f]);
        }
        
        $row['singers'] = array();
        $row['singer_ids'] = explode(',', $row['singer_ids']);
        $row['album_link'] = '';
        
        if (!empty($row['singer_ids'])) {
            $array_singer_ids = array_merge_recursive($array_singer_ids, $row['singer_ids']);
        }
        
        $array_albums[$row['album_id']] = $row;
    }
}

// Lấy các bài hát
if (empty($request_tab) or $request_tab == 'song') {
    $per_page = empty($request_tab) ? $global_array_config['view_singer_main_num_songs'] : $global_array_config['view_singer_detail_num_songs'];
    $db->sqlreset()->from(NV_MOD_TABLE . "_songs")->where("is_official=1 AND status=1 AND FIND_IN_SET(" . $data_singer['artist_id'] . ", singer_ids)");
    
    if (!empty($request_tab)) {
        $db->select("COUNT(*)");
        $all_pages = $db->query($db->sql())->fetchColumn();
    }

    $array_select_fields = nv_get_song_select_fields();
    $db->order("song_id DESC")->offset(($page - 1) * $per_page)->limit($per_page);    
    $db->select(implode(', ', $array_select_fields[0]));
    
    $result = $db->query($db->sql());
    while ($row = $result->fetch()) {
        foreach ($array_select_fields[1] as $f) {
            if (empty($row[$f]) and !empty($row['default_' . $f])) {
                $row[$f] = $row['default_' . $f];
            }
            unset($row['default_' . $f]);
        }
        
        $row['singers'] = array();
        $row['singer_ids'] = explode(',', $row['singer_ids']);
        $row['song_link'] = '';
        
        if (!empty($row['singer_ids'])) {
            $array_singer_ids = array_merge_recursive($array_singer_ids, $row['singer_ids']);
        }
        
        $array_songs[$row['song_id']] = $row;
    }
}

// Xác định ca sĩ
$array_singers = nv_get_artists($array_singer_ids);

foreach ($array_albums as $id => $row) {
    if (!empty($row['singer_ids'])) {
        foreach ($row['singer_ids'] as $singer_id) {
            if (isset($array_singers[$singer_id])) {
                $row['singers'][$singer_id] = $array_singers[$singer_id];
                if (empty($row['album_link'])) {
                    $row['album_link'] = nv_get_detail_album_link($row, $array_singers[$singer_id]);
                }
            }
        }
    }
    if (empty($row['album_link'])) {
        $row['album_link'] = nv_get_detail_album_link($row);
    }
    $array_albums[$id] = $row;
}

foreach ($array_songs as $id => $row) {
    if (!empty($row['singer_ids'])) {
        foreach ($row['singer_ids'] as $singer_id) {
            if (isset($array_singers[$singer_id])) {
                $row['singers'][$singer_id] = $array_singers[$singer_id];
                if (empty($row['song_link'])) {
                    $row['song_link'] = nv_get_detail_song_link($row, $array_singers[$singer_id]);
                }
            }
        }
    }
    if (empty($row['song_link'])) {
        $row['song_link'] = nv_get_detail_song_link($row);
    }
    $array_songs[$id] = $row;
}

// Phân trang
$generate_page = nv_alias_page($page_title, $base_url, $all_pages, $per_page, $page);

$contents = nv_theme_view_singer($data_singer, $request_tab, $array_songs, $array_videos, $array_albums, $generate_page);

include NV_ROOTDIR . '/includes/header.php';
echo nv_site_theme($contents);
include NV_ROOTDIR . '/includes/footer.php';
