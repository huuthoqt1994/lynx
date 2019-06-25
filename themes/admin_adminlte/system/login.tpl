<!-- BEGIN: main -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset={CHARSET}" />
<meta http-equiv="expires" content="0" />
<meta name="resource-type" content="document" />
<meta name="distribution" content="global" />
<meta name="copyright" content="Copyright (c) {SITE_NAME}" />
<meta name="robots" content="noindex, nofollow" />
<meta name="viewport" content="width=device-width">
<title>{SITE_NAME} {NV_TITLEBAR_DEFIS} {GLANG.admin_page}</title>
<link rel="stylesheet" href="{NV_BASE_SITEURL}themes/default/css/bootstrap.min.css">
<link rel="stylesheet" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/css/font-awesome.min.css">

<link rel="stylesheet" href="{NV_BASE_SITEURL}themes/{ADMIN_THEME}/dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="{NV_BASE_SITEURL}themes/{ADMIN_THEME}/plugins/iCheck/square/blue.css">

<link rel="stylesheet" href="{NV_BASE_SITEURL}themes/{ADMIN_THEME}/css/custom.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

<script type="text/javascript">
	var jsi = new Array('{SITELANG}', '{NV_BASE_SITEURL}', '{CHECK_SC}',
			'{GFX_NUM}');
	var login_error_security = '{LOGIN_ERROR_SECURITY}';
	var nv_cookie_prefix = '{NV_COOKIE_PREFIX}';
</script>
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/global.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}themes/{ADMIN_THEME}/js/login.js"></script>
</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<!-- BEGIN: image -->
			<a title="{SITE_NAME}" href="{NV_BASE_SITEURL}"><img src="{LOGO}" width="{WIDTH}" height="{HEIGHT}" alt="{SITE_NAME}" /></a>
			<!-- END: image -->
			<!-- BEGIN: swf -->
			<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="{WIDTH}" height="{HEIGHT}">
				<param name="wmode" value="transparent" />
				<param name="movie" value="{LOGO}" />
				<param name="quality" value="high" />
				<param name="menu" value="false" />
				<param name="seamlesstabbing" value="false" />
				<param name="allowscriptaccess" value="samedomain" />
				<param name="loop" value="true" />
				<!--[if !IE]> <-->
				<object type="application/x-shockwave-flash" width="{WIDTH}" height="{HEIGHT}" data="{LOGO}">
					<param name="wmode" value="transparent" />
					<param name="pluginurl" value="http://www.adobe.com/go/getflashplayer" />
					<param name="loop" value="true" />
					<param name="quality" value="high" />
					<param name="menu" value="false" />
					<param name="seamlesstabbing" value="false" />
					<param name="allowscriptaccess" value="samedomain" />
				</object>
				<!--> <![endif]-->
			</object>
			<!-- END: swf -->
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body m-bottom">
			<p class="login-box-msg">{LOGIN_INFO}</p>
			<form class="loginform" action="{NV_BASE_ADMINURL}index.php" method="post" id="admin-login-form">
				<!-- BEGIN: lang_multi -->
				<p class="muti-lang form-inline{SHOW_LANG}">
					<label for="langinterface">{LANGTITLE}:</label> <select id="langinterface" name="langinterface" onchange="top.location.href=this.options[this.selectedIndex].value;" class="form-control input-sm">
						<!-- BEGIN: option -->
						<option value="{LANGOP}"{SELECTED}>{LANGVALUE}</option>
						<!-- END: option -->
					</select>
				</p>
				<!-- END: lang_multi -->
				<div class="loginStep1{SHOW_STEP1}">
					<p>
						<label for="nv_login">{GLANG.username}:</label> <input class="form-control" name="nv_login" type="text" id="nv_login" value="{V_LOGIN}" />
					</p>
					<p>
						<label for="nv_password">{GLANG.password}:</label> <input class="form-control" name="nv_password" type="password" id="nv_password" value="{V_PASSWORD}" />
					</p>
				</div>
				<div class="loginStep2{SHOW_STEP2}">
					<div{SHOW_OPT}>
						<label>{GLANG.2teplogin_totppin_label}</label> <input type="text" class="form-control" placeholder="{GLANG.2teplogin_totppin_placeholder}" value="" name="nv_totppin" id="nv_totppin" maxlength="6">
						<div class="text-center">
							<a href="#" onclick="return login2step_change(this);">{GLANG.2teplogin_other_menthod}</a>
						</div>
					</div>
					<div{SHOW_CODE}>
						<label>{GLANG.2teplogin_code_label}</label> <input type="text" class="form-control" placeholder="{GLANG.2teplogin_code_placeholder}" value="" name="nv_backupcodepin" id="nv_backupcodepin" maxlength="8">
						<div class="text-center">
							<a href="#" onclick="return login2step_change(this);">{GLANG.2teplogin_other_menthod}</a>
						</div>
					</div>
				</div>
				<!-- BEGIN: captcha -->
				<p>
					<label for="nv_seccode">{N_CAPTCHA}:</label>
				<div class="row">
					<div class="col-xs-10">
						<input name="nv_seccode" type="text" id="seccode" maxlength="{GFX_NUM}" class="form-control captcha" />
					</div>
					<div class="col-xs-11">
						<img id="vimg" alt="{N_CAPTCHA}" src="{NV_BASE_SITEURL}index.php?scaptcha=captcha&t={NV_CURRENTTIME}" width="{GFX_WIDTH}" height="{GFX_HEIGHT}" />
					</div>
					<div class="col-xs-3">
						<em class="fa fa-refresh fa-lg icon-pointer" onclick="nv_change_captcha();">&nbsp;</em>
					</div>
				</div>
				</p>
				<!-- END: captcha -->
				<div id="smb">
					<input type="hidden" name="checkss" value="{NV_CHECK_SESSION}" />
				</div>
				<div class="pull-left">
					<input class="btn btn-primary" type="submit" value="{GLANG.loginsubmit}" />
				</div>
				<div class="pull-right lostpass">
					<a title="{LANGLOSTPASS}" href="{LINKLOSTPASS}">{LANGLOSTPASS}?</a>
				</div>
				<div class="clearfix"></div>
			</form>
		</div>
		<!-- /.login-box-body -->
		<div id="copyright">
			<p>
				Copyright &copy; <a href="{SITEURL}">{SITE_NAME}</a>. All rights reserved.
			</p>
		</div>
	</div>

	<script src="{NV_BASE_SITEURL}themes/{ADMIN_THEME}/bootstrap/js/bootstrap.min.js"></script>
	<script src="{NV_BASE_SITEURL}themes/{ADMIN_THEME}/plugins/iCheck/icheck.min.js"></script>
	<script>
		$(function() {
			$('input').iCheck({
				checkboxClass : 'icheckbox_square-blue',
				radioClass : 'iradio_square-blue',
				increaseArea : '20%' // optional
			});
		});
	</script>
</body>
</html>
<!-- END: main -->
