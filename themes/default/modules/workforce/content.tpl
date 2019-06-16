<!-- BEGIN: main -->
<link type="text/css" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
<link rel="stylesheet" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/select2.min.css" />
<link rel="stylesheet" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/select2-bootstrap.min.css" />
<!-- BEGIN: error -->
<div class="alert alert-warning">{ERROR}</div>
<!-- END: error -->
<form id="form-workforce" class="form-horizontal" action="{NV_BASE_SITEURL}index.php?{NV_LANG_VARIABLE}={NV_LANG_DATA}&amp;{NV_NAME_VARIABLE}={MODULE_NAME}&amp;{NV_OP_VARIABLE}={OP}" method="post">
    <div class="panel panel-default">
        <div class="panel-heading">{LANG.info}</div>
        <div class="panel-body">
            <input type="hidden" name="id" value="{ROW.id}" />
            <input type="hidden" name="redirect" value="{ROW.redirect}" />
            <div class="form-group">
                <label class="col-sm-5 col-md-4 control-label"><strong>{LANG.fullname}</strong> <span class="red">(*)</span></label>
                <div class="col-sm-19 col-md-20">
                    <div class="row">
                        <div class="col-xs-12">
                            <input class="form-control" type="text" name="last_name" value="{ROW.last_name}" required="required" oninvalid="setCustomValidity( nv_required )" oninput="setCustomValidity('')" placeholder="{LANG.last_name}" />
                        </div>
                        <div class="col-xs-12">
                            <input class="form-control" type="text" name="first_name" value="{ROW.first_name}" required="required" oninvalid="setCustomValidity( nv_required )" oninput="setCustomValidity('')" placeholder="{LANG.first_name}" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-5 col-md-4 text-right"><strong>{LANG.gender}</strong></label>
                <div class="col-sm-19 col-md-20">
                    <!-- BEGIN: gender -->
                    <label><input type="radio" name="gender" value="{GENDER.index}"{GENDER.checked} >{GENDER.value}</label>&nbsp;&nbsp;&nbsp;
                    <!-- END: gender -->
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-5 col-md-4 control-label"><strong>{LANG.birthday}</strong> <span class="red">(*)</span></label>
                <div class="col-sm-19 col-md-20">
                    <div class="input-group">
                        <input class="form-control datepicker" type="text" name="birthday" value="{ROW.birthday}" autocomplete="off" />
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button" id="birthday-btn">
                                <em class="fa fa-calendar fa-fix"> </em>
                            </button>
                        </span>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-5 col-md-4 control-label"><strong>{LANG.main_phone}</strong> <span class="red">(*)</span></label>
                <div class="col-sm-19 col-md-20">
                    <input class="form-control" type="number" name="main_phone" value="{ROW.main_phone}" required="required" oninvalid="setCustomValidity( nv_required )" oninput="setCustomValidity('')" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-5 col-md-4 control-label"><strong>{LANG.other_phone}</strong></label>
                <div class="col-sm-19 col-md-20">
                    <input class="form-control" type="number" name="other_phone" value="{ROW.other_phone}" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-5 col-md-4 control-label"><strong>{LANG.main_email}</strong> <span class="red">(*)</span></label>
                <div class="col-sm-19 col-md-20">
                    <input class="form-control" type="text" name="main_email" value="{ROW.main_email}" required="required" oninvalid="setCustomValidity( nv_required )" oninput="setCustomValidity('')" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-5 col-md-4 control-label"><strong>{LANG.other_email}</strong></label>
                <div class="col-sm-19 col-md-20">
                    <input class="form-control" type="text" name="other_email" value="{ROW.other_email}" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-5 col-md-4 control-label"><strong>{LANG.address}</strong></label>
                <div class="col-sm-19 col-md-20">
                    <input class="form-control" type="text" name="address" value="{ROW.address}" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-5 col-md-4 control-label"><strong>{LANG.knowledge}</strong></label>
                <div class="col-sm-19 col-md-20">
                    <textarea class="form-control" style="height: 100px;" cols="75" rows="5" name="knowledge">{ROW.knowledge}</textarea>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-5 col-md-4 control-label"><strong>{LANG.image}</strong></label>
                <div class="col-sm-19 col-md-20">
                    <div class="input-group">
                        <input class="form-control" type="text" name="image" value="{ROW.image}" id="id_image" />
                        <span class="input-group-btn">
                            <button class="btn btn-default selectfile" type="button">
                                <em class="fa fa-folder-open-o fa-fix">&nbsp;</em>
                            </button>
                        </span>
                    </div>
                </div>
            </div>
            <!-- BEGIN: field -->
            <!-- BEGIN: loop -->
            <div class="form-group">
                <label class="col-sm-5 col-md-4 control-label"> <strong>{FIELD.title}</strong> <!-- BEGIN: required --> <span class="red">(*)</span> <!-- END: required -->
                </label>
                <div class="col-sm-19 col-md-20">
                    <!-- BEGIN: textbox -->
                    <input class="form-control {FIELD.required}" type="text" name="custom_fields[{FIELD.field}]" id="{FIELD.field}" value="{FIELD.value}" />
                    <!-- END: textbox -->
                    <!-- BEGIN: date -->
                    <div class="input-group">
                        <input class="form-control datepicker {FIELD.required}" id="{FIELD.field}" type="text" name="custom_fields[{FIELD.field}]" value="{FIELD.value}" pattern="^[0-9]{2,2}\/[0-9]{2,2}\/[0-9]{1,4}$" />
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button">
                                <em class="fa fa-calendar fa-fix"> </em>
                            </button>
                        </span>
                    </div>
                    <!-- END: date -->
                    <!-- BEGIN: textarea -->
                    <textarea rows="5" cols="70" class="form-control" id="{FIELD.field}" name="custom_fields[{FIELD.field}]">{FIELD.value}</textarea>
                    <!-- END: textarea -->
                    <!-- BEGIN: editor -->
                    {EDITOR}
                    <!-- END: editor -->
                    <!-- BEGIN: select -->
                    <select class="form-control" id="{FIELD.field}" name="custom_fields[{FIELD.field}]">
                        <!-- BEGIN: loop -->
                        <option value="{FIELD_CHOICES.key}"{FIELD_CHOICES.selected}>{FIELD_CHOICES.value}</option>
                        <!-- END: loop -->
                    </select>
                    <!-- END: loopselect -->
                    <!-- BEGIN: radio -->
                    <label for="lb_{FIELD_CHOICES.id}"> <input type="radio" name="custom_fields[{FIELD.field}]" value="{FIELD_CHOICES.key}" id="lb_{FIELD_CHOICES.id}"{FIELD_CHOICES.checked}> {FIELD_CHOICES.value}
                    </label>
                    <!-- END: radio -->
                    <!-- BEGIN: checkbox -->
                    <label for="lb_{FIELD_CHOICES.id}"> <input type="checkbox" name="custom_fields[{FIELD.field}][]" value="{FIELD_CHOICES.key}" id="lb_{FIELD_CHOICES.id}"{FIELD_CHOICES.checked}> {FIELD_CHOICES.value}
                    </label>
                    <!-- END: checkbox -->
                    <!-- BEGIN: multiselect -->
                    <select class="form-control" id="{FIELD.field}" name="custom_fields[{FIELD.field}][]" multiple="multiple">
                        <!-- BEGIN: loop -->
                        <option value="{FIELD_CHOICES.key}"{FIELD_CHOICES.selected}>{FIELD_CHOICES.value}</option>
                        <!-- END: loop -->
                    </select>
                    <!-- END: multiselect -->
                    <small class="help-block"><em>{FIELD.description}</em></small>
                </div>
            </div>
            <!-- END: loop -->
            <!-- END: field -->
        </div>
    </div>
    <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#account">{LANG.account}</a></li>
        <li><a data-toggle="tab" href="#workinfo">{LANG.workinfo}</a></li>
        <li><a data-toggle="tab" href="#termofcontract">{LANG.termofcontract}</a></li>
    </ul>
    <div class="tab-content">
        <div id="account" class="tab-pane fade in active">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="form-group">
                        <label class="col-sm-5 col-md-4 control-label"><strong>{LANG.type_account}</strong><span class="red">(*)</span></label>
                        <div class="col-sm-19 col-md-20">
                            <input class="col-sm-19 col-md-20 radio_btn" type="radio" name="portion_selection" id="button_one" value="" />
                            <label class="col-sm-19 col-md-4"><strong>{LANG.haveaccount}</strong></label>
                            <input class="col-sm-19 col-md-20 radio_btn" type="radio" id="button_two" name="portion_selection" value="1" />
                            <label class="col-sm-19 col-md-4"><strong>{LANG.createaccount}</strong></label>
                        </div>
                    </div>
                    <div class="form-group" id="portion_one">
                        <label class="col-sm-5 col-md-4 control-label"><strong>{LANG.user_account}</strong> <span class="red">(*)</span></label>
                        <div class="col-sm-19 col-md-20">
                            <select name="userid" id="userid" class="form-control">
                                <!-- BEGIN: user_info -->
                                <option value="{USER_INFO.userid}" selected="selected">{USER_INFO.fullname}</option>
                                <!-- END: user_info -->
                            </select>
                        </div>
                    </div>
                    <div class="form-group" id="infoaccount" style="display: none">
                        <label class="col-sm-5 col-md-4 control-label"><strong>{LANG.infoaccount}</strong><span class="red">(*)</span></label>
                        <div class="col-sm-19 col-md-20">
                            <div class="row">
                                <div class="col-xs-8">
                                    <input class="form-control us_pas" type="text" name="username" value="{ROW.username}" oninvalid="setCustomValidity( nv_required )" oninput="setCustomValidity('')" placeholder="{LANG.username}" />
                                </div>
                                <div class="col-xs-8">
                                    <input class="form-control us_pas" type="password" name="password" value="{ROW.password}" oninvalid="setCustomValidity( nv_required )" oninput="setCustomValidity('')" placeholder="{LANG.password}" />
                                </div>
                                <div class="col-xs-8">
                                    <input class="form-control us_pas" type="password" name="looppassword" value="{ROW.looppassword}" oninvalid="setCustomValidity( nv_required )" oninput="setCustomValidity('')" placeholder="{LANG.looppassword}" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="workinfo" class="tab-pane fade">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="form-group">
                        <label class="col-sm-5 col-md-4 control-label"><strong>{LANG.part}</strong> <span class="red">(*)</span> </label>
                        <div class="col-sm-19 col-md-20">
                            <select class="form-control " style="height: 200px;" cols="75" name="part[]" multiple="multiple" id="part">
                                <!-- BEGIN: parent_loop -->
                                <option value="{pid}"{pselect}>{ptitle}</option>
                                <!-- END: parent_loop -->
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-5 col-md-4 control-label"><strong>{LANG.position}</strong></label>
                        <div class="col-sm-19 col-md-20">
                            <input class="form-control" type="text" name="position" value="{ROW.position}" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-5 col-md-4 control-label"><strong>{LANG.jointime}</strong></label>
                        <div class="col-sm-19 col-md-20">
                            <div class="input-group">
                                <input class="form-control datepicker" type="text" name="jointime" value="{ROW.jointime}" pattern="^[0-9]{2,2}\/[0-9]{2,2}\/[0-9]{1,4}$" />
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button">
                                        <em class="fa fa-calendar fa-fix"> </em>
                                    </button>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="termofcontract" class="tab-pane fade">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="form-group">
                        <label class="col-sm-5 col-md-4 control-label"><strong>{LANG.createtime}</strong></label>
                        <div class="col-sm-19 col-md-20">
                            <div class="input-group">
                                <input class="form-control" type="text" name="createtime" value="{ROW.createtime}" id="createtime" pattern="^[0-9]{2,2}\/[0-9]{2,2}\/[0-9]{1,4}$" />
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button" id="createtime-btn">
                                        <em class="fa fa-calendar fa-fix"> </em>
                                    </button>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-5 col-md-4 control-label"><strong>{LANG.duetime}</strong></label>
                        <div class="col-sm-19 col-md-20">
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <select class="form-control" name="cycle" id="cycle">
                                        <option value="0">--- {LANG.cycle_month_select} ---</option>
                                        <!-- BEGIN: cycle -->
                                        <option value="{CYCLE.key}"{CYCLE.selected}>{CYCLE.value}</option>
                                        <!-- END: cycle -->
                                    </select>
                                </div>
                                <div class="col-xs-18 col-sm-18 col-md-18">
                                    <div class="input-group">
                                        <input class="form-control" type="text" name="duetime" autocomplete="off" value="{ROW.duetime}" id="duetime" pattern="^[0-9]{2,2}\/[0-9]{2,2}\/[0-9]{1,4}$" />
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button" id="duetime-btn">
                                                <em class="fa fa-calendar fa-fix"> </em>
                                            </button>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="form-group text-center">
        <input type="hidden" name="submit" value="1" />
        <input class="btn btn-primary" type="submit" id="btn-submit" value="{LANG.save}" />
    </div>
</form>
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/language/jquery.ui.datepicker-{NV_LANG_INTERFACE}.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/select2.min.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/i18n/{NV_LANG_INTERFACE}.js"></script>
<script type="text/javascript">
    //<![CDATA[
    $(document).ready(function() {
        $("#userid").select2({
            language : "{NV_LANG_INTERFACE}",
            theme : "bootstrap",
            ajax : {
                url : '{URL_USERS}',
                dataType : 'json',
                delay : 250,
                data : function(params) {
                    return {
                        q : params.term, // search term
                        page : params.page
                    };
                },
                processResults : function(data, params) {
                    params.page = params.page || 1;
                    return {
                        results : data,
                        pagination : {
                            more : (params.page * 30) < data.total_count
                        }
                    };
                },
                cache : true
            },
            escapeMarkup : function(markup) {
                return markup;
            }, // let our custom formatter work
            minimumInputLength : 3,
            templateResult : formatRepo, // omitted for brevity, see the source of this page
            templateSelection : formatRepoSelection
        // omitted for brevity, see the source of this page
        });
        
        $(".datepicker").datepicker({
            dateFormat : "dd/mm/yy",
            changeMonth : true,
            changeYear : true,
            showOtherMonths : true,
            showOn : "focus",
            yearRange : "-90:+5",
        });
        
        $(".selectfile").click(function() {
            var area = "id_image";
            var path = "{NV_UPLOADS_DIR}/{MODULE_UPLOAD}";
            var currentpath = "{NV_UPLOADS_DIR}/{MODULE_UPLOAD}";
            var type = "image";
            nv_open_browse(script_name + "?" + nv_name_variable + "=upload&popup=1&area=" + area + "&path=" + path + "&type=" + type + "&currentpath=" + currentpath, "NVImg", 850, 420, "resizable=no,scrollbars=no,toolbar=no,location=no,status=no");
            return false;
        });
    });
    
    function formatRepo(repo) {
        if (repo.loading)
            return repo.text;
        var markup = '<div class="clearfix">' + '<div class="col-sm-19">' + repo.username + '</div>' + '<div clas="col-sm-5"><span class="show text-right">' + repo.fullname + '</span></div>' + '</div>';
        markup += '</div></div>';
        return markup;
    }
    function formatRepoSelection(repo) {
        $('#username').val(repo.username);
        return repo.username || repo.text;
    }
    $('#form-workforce').submit(function(e) {
        e.preventDefault();
        $.ajax({
            type : 'POST',
            url : script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=content&nocache=' + new Date().getTime(),
            data : $(this).serialize(),
            beforeSend : function() {
                $('#btn-submit').prop('disabled', true);
            },
            success : function(json) {
                if (json.msg) {
                    alert(json.msg);
                }
                if (json.error) {
                    $('#' + json.input).focus();
                    $('#btn-submit').prop('disabled', false);
                    
                } else {
                    window.location.href = json.redirect;
                }
            }
        });
    })
    //]]>
</script>
<script type="text/javascript">
    $('.radio_btn:first').attr('checked', true);
    
    $(function() {
        $("input[name='portion_selection']").click(function() {
            if ($("#button_two").is(":checked")) {
                $("#userid").find('input').prop('disabled', true);
                $(".us_pas").find('input').prop('disabled', false);
                $("#portion_one").hide();
                $("#infoaccount").show();
            } else {
                $("#userid").find('input').prop('disabled', false);
                $(".us_pas").find('input').prop('disabled', true);
                $("#portion_one").show();
                $("#infoaccount").hide();
                
            }
        });
    });
</script>
<script type="text/javascript">
    //<![CDATA[
    $("#createtime,#duetime").datepicker({
        dateFormat : "dd/mm/yy",
        changeMonth : true,
        changeYear : true,
        showOtherMonths : true,
        showOn : "focus",
        yearRange : "-90:+5",
    });    
    
    $('#cycle').change(function(){
        var createtime = $('#createtime').val();
        var cycle = $(this).val();
        $.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=content&nocache=' + new Date().getTime(), 'get_time_end=1&createtime=' + createtime + '&cycle=' + cycle, function(res) {
            var r_split = res.split('_');
            if (r_split[0] == 'OK') {
                $('#duetime').val(r_split[1]);
            }
        });
    });
    
    //]]>
</script>
<!-- END: main -->