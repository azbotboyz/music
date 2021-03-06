/**
 * @Project NUKEVIET MUSIC 4.X
 * @Author PHAN TAN DUNG (phantandung92@gmail.com)
 * @Copyright (C) 2016 PHAN TAN DUNG. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate Sun, 26 Feb 2017 14:04:32 GMT
 */

var loadingHtml = '<div class="text-center"><i class="fa fa-spin fa-spinner fa-2x"></i></div>';
var msAjaxURL = nv_base_siteurl + 'index.php?' + nv_lang_variable + '=' + nv_lang_data + '&' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=ajax&nocache=' + new Date().getTime();

function msLoadLyric(soCode, soTitle, tokend, resTitle, resDoby) {
    $(resTitle).html(soTitle);
    $(resDoby).removeClass('open');
    $(resDoby).html(loadingHtml);
    $.post(msAjaxURL, 'getSongLyric=1&song_code=' + soCode + '&tokend=' + tokend, function(res) {
        $(resDoby).html(res);
    });
}

function msJwplayerStyleCaption(jw) {
    jw.setCaptions({
        color: '#fff',
        fontSize: 32,
        fontOpacity: 90,
        edgeStyle: 'uniform',
        backgroundOpacity: 0
    });
}

$(document).ready(function() {
    $('[data-toggle="show-va-singer"]').click(function(e) {
        e.preventDefault();
        modalShowByObj($(this).data('target'));
    });
    $('[data-toggle="togglehview"]').click(function(e) {
        e.preventDefault();
        var tg = $(this).data('target');
        var uq = $(this).data('unique');
        var md = $(this).data('mode');
        $(tg).toggleClass('open');
        $('[data-toggle="togglehview"]').each(function() {
            if ($(this).data('unique') == uq) {
                if ($(this).data('mode') == md) {
                    $(this).hide();
                } else {
                    $(this).show();
                }
            }
        });
    });
    $('[data-toggle="scrolltodiv"]').click(function(e) {
        e.preventDefault();
        var target = $($(this).data('target'));
        if (target.length) {
            $('html,body').animate({
                scrollTop: target.offset().top
            }, 500);
        }
    });
    $(document).delegate('[data-toggle="select-all"]', 'click focus', function() {
        $(this).select();
    });
});