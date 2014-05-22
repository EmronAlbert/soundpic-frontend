<%@ include file="/WEB-INF/jsp/include.jsp"%>
<!doctype html>
<head>
	<title>SoundPic</title>
	<link rel="stylesheet" type="text/css" href="public_html/styles/login.css">
	<link rel="shortcut icon" type="image/x-icon" href="public_html/img/favicon.ico">
</head>
<body>
	<div class="loginform">
	<h1>Forgot Password</h1>
	<br />
		<form name="forgotPassword" action="forgotpassword" method="post">
			<div>
				<input type="text" name="j_username" value="Enter your email address" onfocus="if(this.value == 'Enter your email address'){this.value = '';}" onblur="if(this.value == ''){this.value = 'Enter your email address';}"/>
				<input type="submit" name="recoverBtn" value="Recover Password">
			</div>
		</form>

		<div class="leftAlign">
			<a href="login">&laquo; Back to login</a>
		</div>
		<br clear="all">
	</div>
</body>
</html>