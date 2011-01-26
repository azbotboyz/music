<?php
/**
 * @Project NUKEVIET-MUSIC
 * @Author Phan Tan Dung (phantandung92@gmail.com)
 * @Copyright (C) 2011
 * @Createdate 26/01/2011 08:39 AM
 */
if(!defined('NV_IS_MUSIC_ADMIN'))
{
	die('Stop!!!');
}
$page_title = $lang_module['check_song'];
$contents = '' ;

$xtpl = new XTemplate("check_link.tpl", NV_ROOTDIR . "/themes/" . $global_config['module_theme'] . "/modules/" . $module_name);
$xtpl->assign('LANG', $lang_module);
$xtpl->assign('URL_DEL', "index.php?" . NV_NAME_VARIABLE . "=" . $module_name . "&" . NV_OP_VARIABLE . "=delallsr" );
$xtpl->assign('URL_DEL_BACK', "index.php?" . NV_NAME_VARIABLE . "=" . $module_name . "&" . NV_OP_VARIABLE . "=error" );

$setting = setting_music();
$listall = $nv_Request->get_string('listall', 'post,get');
$array_id = explode(',', $listall);
$array_id = array_map("intval", $array_id);
$result = false;
$link_del = "index.php?" . NV_NAME_VARIABLE . "=" . $module_name . "&" . NV_OP_VARIABLE . "=delsr";
$link_edit = "index.php?" . NV_NAME_VARIABLE . "=" . $module_name . "&" . NV_OP_VARIABLE . "=addsong";

foreach($array_id as $id)
{
	if($id > 0)
	{
		$sql = "SELECT `key`, `where` FROM " . NV_PREFIXLANG . "_" . $module_data . "_error WHERE id = " . $id;
		$rs = $db->sql_fetchrow( $db->sql_query( $sql ) );
		if ( $rs['where'] == "album" ) continue ;
		$song = getsongbyID( $rs['key'] );
		
		$xtpl->assign('id', $song['id'] );
		$xtpl->assign('songname', $song['tenthat'] );
		$xtpl->assign('URL_DEL_ONE', $link_del . "&id=" . $song['id']);
		$xtpl->assign('URL_EDIT', $link_edit . "&id=" . $song['id']);
		$xtpl->assign( 'URL', $mainURL . "=listenone/" . $song['id'] . "/" . $song['ten'] );

		$url = outputURL ( $song['server'], $song['duongdan'] ) ;
		if ( $song['server'] == 1 ) { $url = NV_MY_DOMAIN . $url ; }
		if (  nv_check_url( $url ) )
		{
			$xtpl->assign('result', $lang_module['check_link_suc']);
		}
		else
		{
			$xtpl->assign('result', $lang_module['check_link_err1']);
		}
		$xtpl->parse('main.loop');
	}
}

$xtpl->parse('main');
$contents .= $xtpl->text('main');;

include (NV_ROOTDIR . "/includes/header.php");
echo nv_admin_theme($contents);
include (NV_ROOTDIR . "/includes/footer.php");
?>