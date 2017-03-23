<!-- BEGIN: main -->
<div class="alert alert-info">{CONFIG_NOTE}.</div>
<form action="{FORM_ACTION}" method="post" role="form" class="form-horizontal" autocomplete="off" data-toggle="validate" data-type="ajax">
    <div class="form-result"></div>
    <div class="form-element">
        <div class="row">
            <div class="col-md-12 col-lg-12">
                <div class="panel panel-info">
                    <div class="panel-heading"><strong>{LANG.config_display}</strong></div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label for="limit_singers_displayed" class="control-label col-sm-8">{LANG.limit_singers_displayed}:</label>
                            <div class="col-sm-16">
                                <select name="limit_singers_displayed" id="limit_singers_displayed" class="form-control" data-toggle="mscfgmainweight" data-value="{DATA.limit_singers_displayed}">
                                    <!-- BEGIN: limit_singers_displayed -->
                                    <option value="{LIMIT_SINGERS_DISPLAYED.key}"{LIMIT_SINGERS_DISPLAYED.selected}>{LIMIT_SINGERS_DISPLAYED.title}</option>
                                    <!-- END: limit_singers_displayed -->
                                </select>
                                <i class="help-block">{LANG.limit_singers_displayed_help}</i>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="various_artists" class="control-label col-sm-8"><i class="fa fa-asterisk"></i> {LANG.various_artists}:</label>
                            <div class="col-sm-16">
                                <input class="form-control required" type="text" name="various_artists" id="various_artists" value="{DATA.various_artists}"/>
                                <i class="help-block">{LANG.various_artists_help}</i>
                            </div>
                        </div>    
                        <div class="form-group">
                            <label for="unknow_singer" class="control-label col-sm-8"><i class="fa fa-asterisk"></i> {LANG.unknow_singer}:</label>
                            <div class="col-sm-16">
                                <input class="form-control required" type="text" name="unknow_singer" id="unknow_singer" value="{DATA.unknow_singer}"/>
                                <i class="help-block">{LANG.unknow_singer_help}</i>
                            </div>
                        </div>    
                    </div>
                </div>
                <div class="panel panel-info">
                    <div class="panel-heading"><strong>{LANG.config_view_singer}</strong></div>
                    <div class="panel-body">
                        <div class="form-group">
                            <div class="col-sm-offset-8 col-sm-16">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="view_singer_show_header" id="view_singer_show_header" value="1"{DATA.view_singer_show_header} /> {LANG.view_singer_show_header}
                                    </label>
                                </div>
                                <i class="help-block">{LANG.view_singer_show_header_help}</i>  
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="view_singer_headtext_length" class="control-label col-sm-8">{LANG.view_singer_headtext_length}:</label>
                            <div class="col-sm-16">
                                <input class="form-control required" type="text" name="view_singer_headtext_length" id="view_singer_headtext_length" value="{DATA.view_singer_headtext_length}" data-pattern="^[0-9]+$" data-mess="{LANG.validate_number_min0}"/>
                                <i class="help-block">{LANG.view_singer_headtext_length_help}</i>
                            </div>
                        </div>    
                        <div class="form-group">
                            <label for="arr_view_singer_tabs_alias_song" class="control-label col-sm-8"><i class="fa fa-asterisk"></i> {LANG.arr_view_singer_tabs_alias_song}:</label>
                            <div class="col-sm-16">
                                <input class="form-control required" type="text" name="arr_view_singer_tabs_alias_song" id="arr_view_singer_tabs_alias_song" value="{DATA.arr_view_singer_tabs_alias_song}" data-pattern="^[a-z\-]{1,30}$" data-mess="{LANG.validate_alias_lowercase_min1max30}"/>
                            </div>
                        </div>    
                        <div class="form-group">
                            <label for="arr_view_singer_tabs_alias_video" class="control-label col-sm-8"><i class="fa fa-asterisk"></i> {LANG.arr_view_singer_tabs_alias_video}:</label>
                            <div class="col-sm-16">
                                <input class="form-control required" type="text" name="arr_view_singer_tabs_alias_video" id="arr_view_singer_tabs_alias_video" value="{DATA.arr_view_singer_tabs_alias_video}" data-pattern="^[a-z\-]{1,30}$" data-mess="{LANG.validate_alias_lowercase_min1max30}"/>
                            </div>
                        </div>    
                        <div class="form-group">
                            <label for="arr_view_singer_tabs_alias_album" class="control-label col-sm-8"><i class="fa fa-asterisk"></i> {LANG.arr_view_singer_tabs_alias_album}:</label>
                            <div class="col-sm-16">
                                <input class="form-control required" type="text" name="arr_view_singer_tabs_alias_album" id="arr_view_singer_tabs_alias_album" value="{DATA.arr_view_singer_tabs_alias_album}" data-pattern="^[a-z\-]{1,30}$" data-mess="{LANG.validate_alias_lowercase_min1max30}"/>
                            </div>
                        </div>    
                        <div class="form-group">
                            <label for="arr_view_singer_tabs_alias_profile" class="control-label col-sm-8"><i class="fa fa-asterisk"></i> {LANG.arr_view_singer_tabs_alias_profile}:</label>
                            <div class="col-sm-16">
                                <input class="form-control required" type="text" name="arr_view_singer_tabs_alias_profile" id="arr_view_singer_tabs_alias_profile" value="{DATA.arr_view_singer_tabs_alias_profile}" data-pattern="^[a-z\-]{1,30}$" data-mess="{LANG.validate_alias_lowercase_min1max30}"/>
                            </div>
                        </div>    
                        <div class="form-group">
                            <label for="view_singer_main_num_songs" class="control-label col-sm-8"><i class="fa fa-asterisk"></i> {LANG.view_singer_main_num_songs}:</label>
                            <div class="col-sm-16">
                                <input class="form-control required" type="text" name="view_singer_main_num_songs" id="view_singer_main_num_songs" value="{DATA.view_singer_main_num_songs}" data-pattern="^(?!0)[0-9]+$" data-mess="{LANG.validate_number_min1}"/>
                            </div>
                        </div>    
                        <div class="form-group">
                            <label for="view_singer_main_num_videos" class="control-label col-sm-8"><i class="fa fa-asterisk"></i> {LANG.view_singer_main_num_videos}:</label>
                            <div class="col-sm-16">
                                <input class="form-control required" type="text" name="view_singer_main_num_videos" id="view_singer_main_num_videos" value="{DATA.view_singer_main_num_videos}" data-pattern="^(?!0)[0-9]+$" data-mess="{LANG.validate_number_min1}"/>
                            </div>
                        </div>    
                        <div class="form-group">
                            <label for="view_singer_main_num_albums" class="control-label col-sm-8"><i class="fa fa-asterisk"></i> {LANG.view_singer_main_num_albums}:</label>
                            <div class="col-sm-16">
                                <input class="form-control required" type="text" name="view_singer_main_num_albums" id="view_singer_main_num_albums" value="{DATA.view_singer_main_num_albums}" data-pattern="^(?!0)[0-9]+$" data-mess="{LANG.validate_number_min1}"/>
                            </div>
                        </div>    
                        <div class="form-group">
                            <label for="view_singer_detail_num_songs" class="control-label col-sm-8"><i class="fa fa-asterisk"></i> {LANG.view_singer_detail_num_songs}:</label>
                            <div class="col-sm-16">
                                <input class="form-control required" type="text" name="view_singer_detail_num_songs" id="view_singer_detail_num_songs" value="{DATA.view_singer_detail_num_songs}" data-pattern="^(?!0)[0-9]+$" data-mess="{LANG.validate_number_min1}"/>
                            </div>
                        </div>    
                        <div class="form-group">
                            <label for="view_singer_detail_num_videos" class="control-label col-sm-8"><i class="fa fa-asterisk"></i> {LANG.view_singer_detail_num_videos}:</label>
                            <div class="col-sm-16">
                                <input class="form-control required" type="text" name="view_singer_detail_num_videos" id="view_singer_detail_num_videos" value="{DATA.view_singer_detail_num_videos}" data-pattern="^(?!0)[0-9]+$" data-mess="{LANG.validate_number_min1}"/>
                            </div>
                        </div>    
                        <div class="form-group">
                            <label for="view_singer_detail_num_albums" class="control-label col-sm-8"><i class="fa fa-asterisk"></i> {LANG.view_singer_detail_num_albums}:</label>
                            <div class="col-sm-16">
                                <input class="form-control required" type="text" name="view_singer_detail_num_albums" id="view_singer_detail_num_albums" value="{DATA.view_singer_detail_num_albums}" data-pattern="^(?!0)[0-9]+$" data-mess="{LANG.validate_number_min1}"/>
                            </div>
                        </div>    
                    </div>
                </div>
                <div class="panel panel-info">
                    <div class="panel-heading"><strong>{LANG.config_urls_system}</strong></div>
                    <div class="panel-body">
                        <div class="alert alert-warning"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i>&nbsp;{LANG.config_alert_change}</div>
                        <div class="form-group">
                            <label for="arr_code_prefix_singer" class="control-label col-sm-8"><i class="fa fa-asterisk"></i> {LANG.arr_code_prefix_singer}:</label>
                            <div class="col-sm-16">
                                <input class="form-control required" type="text" name="arr_code_prefix_singer" id="arr_code_prefix_singer" value="{DATA.arr_code_prefix_singer}" data-pattern="^[a-z]{OPEN_BRACKET}2{CLOSE_BRACKET}$" data-mess="{LANG.validate_alias_lowercase_len2}"/>
                            </div>
                        </div>    
                        <div class="form-group">
                            <label for="arr_code_prefix_playlist" class="control-label col-sm-8"><i class="fa fa-asterisk"></i> {LANG.arr_code_prefix_playlist}:</label>
                            <div class="col-sm-16">
                                <input class="form-control required" type="text" name="arr_code_prefix_playlist" id="arr_code_prefix_playlist" value="{DATA.arr_code_prefix_playlist}" data-pattern="^[a-z]{OPEN_BRACKET}2{CLOSE_BRACKET}$" data-mess="{LANG.validate_alias_lowercase_len2}"/>
                            </div>
                        </div>    
                        <div class="form-group">
                            <label for="arr_code_prefix_album" class="control-label col-sm-8"><i class="fa fa-asterisk"></i> {LANG.arr_code_prefix_album}:</label>
                            <div class="col-sm-16">
                                <input class="form-control required" type="text" name="arr_code_prefix_album" id="arr_code_prefix_album" value="{DATA.arr_code_prefix_album}" data-pattern="^[a-z]{OPEN_BRACKET}2{CLOSE_BRACKET}$" data-mess="{LANG.validate_alias_lowercase_len2}"/>
                            </div>
                        </div>    
                        <div class="form-group">
                            <label for="arr_code_prefix_video" class="control-label col-sm-8"><i class="fa fa-asterisk"></i> {LANG.arr_code_prefix_video}:</label>
                            <div class="col-sm-16">
                                <input class="form-control required" type="text" name="arr_code_prefix_video" id="arr_code_prefix_video" value="{DATA.arr_code_prefix_video}" data-pattern="^[a-z]{OPEN_BRACKET}2{CLOSE_BRACKET}$" data-mess="{LANG.validate_alias_lowercase_len2}"/>
                            </div>
                        </div>    
                        <div class="form-group">
                            <label for="arr_code_prefix_cat" class="control-label col-sm-8"><i class="fa fa-asterisk"></i> {LANG.arr_code_prefix_cat}:</label>
                            <div class="col-sm-16">
                                <input class="form-control required" type="text" name="arr_code_prefix_cat" id="arr_code_prefix_cat" value="{DATA.arr_code_prefix_cat}" data-pattern="^[a-z]{OPEN_BRACKET}2{CLOSE_BRACKET}$" data-mess="{LANG.validate_alias_lowercase_len2}"/>
                            </div>
                        </div>    
                        <div class="form-group">
                            <label for="arr_code_prefix_song" class="control-label col-sm-8"><i class="fa fa-asterisk"></i> {LANG.arr_code_prefix_song}:</label>
                            <div class="col-sm-16">
                                <input class="form-control required" type="text" name="arr_code_prefix_song" id="arr_code_prefix_song" value="{DATA.arr_code_prefix_song}" data-pattern="^[a-z]{OPEN_BRACKET}2{CLOSE_BRACKET}$" data-mess="{LANG.validate_alias_lowercase_len2}"/>
                            </div>
                        </div>    
                        <div class="form-group">
                            <label for="arr_op_alias_prefix_song" class="control-label col-sm-8">{LANG.arr_op_alias_prefix_song}:</label>
                            <div class="col-sm-16">
                                <input class="form-control required" type="text" name="arr_op_alias_prefix_song" id="arr_op_alias_prefix_song" value="{DATA.arr_op_alias_prefix_song}" data-pattern="(^(?!\-)[a-z\-]+$|^$)" data-mess="{LANG.validate_alias_lowercase_max50}"/>
                            </div>
                        </div>    
                        <div class="form-group">
                            <label for="arr_op_alias_prefix_album" class="control-label col-sm-8">{LANG.arr_op_alias_prefix_album}:</label>
                            <div class="col-sm-16">
                                <input class="form-control required" type="text" name="arr_op_alias_prefix_album" id="arr_op_alias_prefix_album" value="{DATA.arr_op_alias_prefix_album}" data-pattern="(^(?!\-)[a-z\-]+$|^$)" data-mess="{LANG.validate_alias_lowercase_max50}"/>
                            </div>
                        </div>    
                        <div class="form-group">
                            <label for="arr_op_alias_prefix_video" class="control-label col-sm-8">{LANG.arr_op_alias_prefix_video}:</label>
                            <div class="col-sm-16">
                                <input class="form-control required" type="text" name="arr_op_alias_prefix_video" id="arr_op_alias_prefix_video" value="{DATA.arr_op_alias_prefix_video}" data-pattern="(^(?!\-)[a-z\-]+$|^$)" data-mess="{LANG.validate_alias_lowercase_max50}"/>
                            </div>
                        </div>    
                    </div>
                </div>
            </div>
            <div class="col-md-12 col-lg-12">
                <div class="panel panel-info">
                    <div class="panel-heading"><strong>{LANG.config_mainpage}</strong></div>
                    <div class="panel-body">
                        <div class="form-group">
                            <div class="col-sm-offset-8 col-sm-16">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="home_albums_display" id="home_albums_display" value="1"{DATA.home_albums_display} /> {LANG.home_albums_display}
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-8 col-sm-16">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="home_singers_display" id="home_singers_display" value="1"{DATA.home_singers_display} /> {LANG.home_singers_display}
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-8 col-sm-16">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="home_songs_display" id="home_songs_display" value="1"{DATA.home_songs_display} /> {LANG.home_songs_display}
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-8 col-sm-16">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="home_videos_display" id="home_videos_display" value="1"{DATA.home_videos_display} /> {LANG.home_videos_display}
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="home_albums_weight" class="control-label col-sm-8">{LANG.home_albums_weight}:</label>
                            <div class="col-sm-16">
                                <select name="home_albums_weight" id="home_albums_weight" class="form-control" data-toggle="mscfgmainweight" data-value="{DATA.home_albums_weight}">
                                    <!-- BEGIN: home_albums_weight -->
                                    <option value="{WEIGHT}"{HOME_ALBUMS_WEIGHT}>{WEIGHT}</option>
                                    <!-- END: home_albums_weight -->
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="home_singers_weight" class="control-label col-sm-8">{LANG.home_singers_weight}:</label>
                            <div class="col-sm-16">
                                <select name="home_singers_weight" id="home_singers_weight" class="form-control" data-toggle="mscfgmainweight" data-value="{DATA.home_singers_weight}">
                                    <!-- BEGIN: home_singers_weight -->
                                    <option value="{WEIGHT}"{HOME_SINGERS_WEIGHT}>{WEIGHT}</option>
                                    <!-- END: home_singers_weight -->
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="home_songs_weight" class="control-label col-sm-8">{LANG.home_songs_weight}:</label>
                            <div class="col-sm-16">
                                <select name="home_songs_weight" id="home_songs_weight" class="form-control" data-toggle="mscfgmainweight" data-value="{DATA.home_songs_weight}">
                                    <!-- BEGIN: home_songs_weight -->
                                    <option value="{WEIGHT}"{HOME_SONGS_WEIGHT}>{WEIGHT}</option>
                                    <!-- END: home_songs_weight -->
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="home_videos_weight" class="control-label col-sm-8">{LANG.home_videos_weight}:</label>
                            <div class="col-sm-16">
                                <select name="home_videos_weight" id="home_videos_weight" class="form-control" data-toggle="mscfgmainweight" data-value="{DATA.home_videos_weight}">
                                    <!-- BEGIN: home_videos_weight -->
                                    <option value="{WEIGHT}"{HOME_VIDEOS_WEIGHT}>{WEIGHT}</option>
                                    <!-- END: home_videos_weight -->
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="home_albums_nums" class="control-label col-sm-8">{LANG.home_albums_nums}:</label>
                            <div class="col-sm-16">
                                <input class="form-control required" type="text" name="home_albums_nums" id="home_albums_nums" value="{DATA.home_albums_nums}" data-pattern="^(?!0)[0-9]+$" data-mess="{LANG.validate_number_min1}"/>
                                <i class="help-block">{LANG.config_available_if_choose}</i>    
                            </div>
                        </div>    
                        <div class="form-group">
                            <label for="home_singers_nums" class="control-label col-sm-8">{LANG.home_singers_nums}:</label>
                            <div class="col-sm-16">
                                <input class="form-control required" type="text" name="home_singers_nums" id="home_singers_nums" value="{DATA.home_singers_nums}" data-pattern="^(?!0)[0-9]+$" data-mess="{LANG.validate_number_min1}"/>
                                <i class="help-block">{LANG.config_available_if_choose}</i>    
                            </div>
                        </div>    
                        <div class="form-group">
                            <label for="home_songs_nums" class="control-label col-sm-8">{LANG.home_songs_nums}:</label>
                            <div class="col-sm-16">
                                <input class="form-control required" type="text" name="home_songs_nums" id="home_songs_nums" value="{DATA.home_songs_nums}" data-pattern="^(?!0)[0-9]+$" data-mess="{LANG.validate_number_min1}"/>
                                <i class="help-block">{LANG.config_available_if_choose}</i>    
                            </div>
                        </div>    
                        <div class="form-group">
                            <label for="home_videos_nums" class="control-label col-sm-8">{LANG.home_videos_nums}:</label>
                            <div class="col-sm-16">
                                <input class="form-control required" type="text" name="home_videos_nums" id="home_videos_nums" value="{DATA.home_videos_nums}" data-pattern="^(?!0)[0-9]+$" data-mess="{LANG.validate_number_min1}"/>
                                <i class="help-block">{LANG.config_available_if_choose}</i>
                            </div>
                        </div>    
                    </div>
                </div>
                <div class="panel panel-info">
                    <div class="panel-heading"><strong>{LANG.config_list_albums}</strong></div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label for="gird_albums_percat_nums" class="control-label col-sm-8">{LANG.gird_albums_percat_nums}:</label>
                            <div class="col-sm-16">
                                <input class="form-control required" type="text" name="gird_albums_percat_nums" id="gird_albums_percat_nums" value="{DATA.gird_albums_percat_nums}" data-pattern="^(?!0)[0-9]+$" data-mess="{LANG.validate_number_min1}"/>
                                <i class="help-block">{LANG.gird_albums_percat_nums_help}</i>
                            </div>
                        </div>    
                        <div class="form-group">
                            <label for="gird_albums_incat_nums" class="control-label col-sm-8">{LANG.gird_albums_incat_nums}:</label>
                            <div class="col-sm-16">
                                <input class="form-control required" type="text" name="gird_albums_incat_nums" id="gird_albums_incat_nums" value="{DATA.gird_albums_incat_nums}" data-pattern="^(?!0)[0-9]+$" data-mess="{LANG.validate_number_min1}"/>
                                <i class="help-block">{LANG.gird_albums_incat_nums_help}</i>
                            </div>
                        </div>    
                    </div>
                </div>
                <div class="panel panel-info">
                    <div class="panel-heading"><strong>{LANG.config_structre_data_page_title}</strong></div>
                    <div class="panel-body">
                        <div class="alert alert-warning"><i class="fa fa-info-circle" aria-hidden="true"></i>&nbsp;{LANG.funcs_note}</div>
                        <strong>{LANG.funcs_album}:</strong>
                        <hr class="sm"/>
                        <div class="form-group">
                            <label for="arr_funcs_sitetitle_album" class="control-label col-sm-8">{LANG.funcs_sitetitle}:</label>
                            <div class="col-sm-16">
                                <input class="form-control" type="text" name="arr_funcs_sitetitle_album" id="arr_funcs_sitetitle_album" value="{DATA.arr_funcs_sitetitle_album}"/>
                                <i class="help-block">{LANG.funcs_sitetitle_help}</i> 
                            </div>
                        </div>    
                        <div class="form-group">
                            <label for="arr_funcs_keywords_album" class="control-label col-sm-8">{LANG.funcs_keywords}:</label>
                            <div class="col-sm-16">
                                <input class="form-control" type="text" name="arr_funcs_keywords_album" id="arr_funcs_keywords_album" value="{DATA.arr_funcs_keywords_album}"/>
                                <i class="help-block">{LANG.funcs_keywords_help}</i> 
                            </div>
                        </div>    
                        <div class="form-group">
                            <label for="arr_funcs_description_album" class="control-label col-sm-8">{LANG.funcs_description}:</label>
                            <div class="col-sm-16">
                                <input class="form-control" type="text" name="arr_funcs_description_album" id="arr_funcs_description_album" value="{DATA.arr_funcs_description_album}"/>
                                <i class="help-block">{LANG.funcs_description_help}</i>
                            </div>
                        </div>    
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-8 col-sm-16">
                <input type="hidden" name="submit" value="1"/>
                <input type="submit" value="{LANG.save}" class="btn btn-primary"/>
            </div>
        </div>
    </div>
</form>
<!-- END: main -->