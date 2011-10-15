<?php

/**
 * @Project NUKEVIET 3.0
 * @Author VINADES.,JSC (contact@vinades.vn)
 * @Copyright (C) 2010 VINADES., JSC. All rights reserved
 * @Createdate 3-6-2010 0:14
 */

if ( ! defined( 'NV_IS_MOD_MUSIC' ) ) die( 'Stop!!!' );

$allsinger = getallsinger();

$id = $nv_Request->get_int( 'id', 'get', 0 );

if ( $id > 0 )
{
        $result_send = "";
        $check = false;
        $checkss = $nv_Request->get_string( 'checkss', 'post', '' );

        if ( defined( 'NV_IS_USER' ) )
        {
            $name = $user_info['username'];
            $youremail = $user_info['email'];
        }
        else
        {
            $name = filter_text_input( 'name', 'post', '', 1 );
            $youremail = filter_text_input( 'youremail', 'post', '' );
        }
        $to_mail = $content = "";
		
		$sql = "SELECT * FROM " . NV_PREFIXLANG . "_" . $module_data . " WHERE id = " . $id . " AND `active`=1";
		$result = $db->sql_query( $sql );
		$song = $db->sql_fetchrow( $result );
		
		if ( $nv_Request->get_int( 'send', 'post', 0 ) == 1 )
		{
			$link = "" . $global_config['site_url'] . "" . $mainURL . "=listenone/" . $id . "/" . $song['ten'];
			$link = "<a href=\"$link\">$link</a>\n";
            $nv_seccode = filter_text_input( 'nv_seccode', 'post', '' );
            $to_mail = filter_text_input( 'email', 'post', '' );
            $content = filter_text_input( 'content', 'post', '', 1 );
            $err_email = nv_check_valid_email( $to_mail );
            $err_youremail = nv_check_valid_email( $youremail );
            $err_name = "";
            $message = "";
            $success = "";
            if ( $global_config['gfx_chk'] > 0 and ! nv_capcha_txt( $nv_seccode ) )
            {
                $err_name = $lang_global['securitycodeincorrect'];
            }
            elseif ( empty( $name ) )
            {
                $err_name = $lang_module['sendmail_err_name'];
            }
            elseif ( empty( $err_email ) and empty( $err_youremail ) )
            {
                $subject = "".$lang_module['sendmail_welcome'].": ".$name;
                $message .= "".$lang_module['sendmail_welcome_1']." 
							<strong>" . $global_config['site_name'] . "</strong>
							".$lang_module['sendmail_welcome_2']."<br />
							<br />".$lang_module['song']."<strong> " . $song['tenthat'] . "</strong> ".$lang_module['sendmail_singer_show']." <strong> " . $allsinger[$song['casi']] . " </strong> ".$lang_module['show_2'].".<br/>
							<br />".$lang_module['message'].": " . $content . "<br />
							<br /><strong>".$lang_module['sendmail_welcome_3'].": </strong><br />" . $link . "";
                $from = array( 
                    $name, $youremail 
                );
                $check = nv_sendmail( $from, $to_mail, $subject, $message );
                if ( $check )
                {
                    $success = "".$lang_module['send_mail_success']."<strong> " . $to_mail . "</strong>";
                }
                else
                {
                    $success = $lang_module['send_mail_err'];
                }
            }
            $result_send = array( 
                "err_name" => $err_name, 
				"err_email" => $err_email, 
				"err_yourmail" => $err_youremail, 
				"send_success" => $success, 
				"check" => $check 
            );
		}
		
        $sendmail = array( 
            "id" => $id, 
			"checkss" => md5( $id . session_id() . $global_config['sitekey'] ), 
			"v_name" => $name, 
			"song" => $song['tenthat'], 
			"singer" => $allsinger[$song['casi']], 
			"v_mail" => $youremail, 
			"to_mail" => $to_mail, 
			"content" => $content, 
			"result" => $result_send, 
			"action" => "" . NV_BASE_SITEURL . "index.php?" . NV_LANG_VARIABLE . "=" . NV_LANG_DATA . "&amp;" . NV_NAME_VARIABLE . "=" . $module_name . "&amp;" . NV_OP_VARIABLE . "=sendmail&amp;id=" . $id 
        );
		
	$contents = nv_sendmail_themme( $sendmail );
	include ( NV_ROOTDIR . "/includes/header.php" );
	echo $contents;
	include ( NV_ROOTDIR . "/includes/footer.php" );
}

Header( "Location: " . $global_config['site_url'] );
exit();

?>


