<?php

/**
 * @Project NUKEVIET 3.0
 * @Author VINADES.,JSC (contact@vinades.vn)
 * @Copyright (C) 2010 VINADES.,JSC. All rights reserved
 * @Createdate 9-8-2010 14:43
 */
if ( ! defined( 'NV_IS_MUSIC_ADMIN' ) ) die( 'Stop!!!' );
$page_title = $lang_module['error_list'];
$contents = '' ;


// ket qua
$xtpl = new XTemplate("error.tpl", NV_ROOTDIR . "/themes/" . $global_config['module_theme'] . "/modules/" . $module_name);
$xtpl->assign('LANG', $lang_module);
$xtpl->assign('URL_DEL_BACK', "index.php?" . NV_NAME_VARIABLE . "=" . $module_name."&op=error");
$xtpl->assign('URL_DEL', "index.php?" . NV_NAME_VARIABLE . "=" . $module_name . "&" . NV_OP_VARIABLE . "=delall&where=_error");
$xtpl->assign('URL_CHECK', "index.php?" . NV_NAME_VARIABLE . "=" . $module_name . "&" . NV_OP_VARIABLE . "=checksonglist");

//lay du lieu
$sql = "SELECT * FROM " . NV_PREFIXLANG . "_" . $module_data."_error ORDER BY id DESC" ;
$result = mysql_query( $sql );

$link_del = "index.php?" . NV_NAME_VARIABLE . "=" . $module_name . "&" . NV_OP_VARIABLE . "=del";

while($rs = $db->sql_fetchrow($result))
{
	$xtpl->assign('id', $rs['id']);
	$xtpl->assign('name', $rs['user']);
	$xtpl->assign('body', $rs['body']);
	if( $rs['where'] == 'song' )
	{
		$album = getsongbyID( $rs['key'] );
		$xtpl->assign('what', $lang_module['song'] . ' ' . $album['tenthat']);

		$xtpl->assign('SONG', $rs['key']);
		$xtpl->parse('main.row.check');
	}
	else
	{
		$song = getalbumbyID( $rs['key'] );
		$xtpl->assign('what', $lang_module['album'] . ' ' . $song['tname']);	
	}
	
	$class = ($i % 2) ? " class=\"second\"" : "";
	$xtpl->assign('class', $class);
	$xtpl->assign('URL_DEL_ONE', $link_del . "&where=_error&id=" . $rs['id']);
	$xtpl->parse('main.row');
}

$xtpl->parse('main');
$contents .= $xtpl->text('main');
include (NV_ROOTDIR . "/includes/header.php");
echo nv_admin_theme($contents);
include (NV_ROOTDIR . "/includes/footer.php");

?>