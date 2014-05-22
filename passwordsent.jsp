<%@ include file="/WEB-INF/jsp/include.jsp"%>
<!doctype html>
<html>
	<head>
		<title>SoundPic</title>
		<link rel="stylesheet" type="text/css" href="public_html/styles/login.css">
		<link rel="shortcut icon" type="image/x-icon" href="public_html/img/favicon.ico">
		<script>
			redirTime = "2000";
			redirURL = "login";
			function redirTimer() { self.setTimeout("self.location.href = redirURL;",redirTime); }
		</script>

	</head>
	<body onload="redirTimer()">
		<div class="loginform">
		<h1>Your password has been sent to your email address!</h1>
		<br />
			<br/>
			<div class="leftAlign">
				<a href="login">&laquo; Back to login</a>
			</div>
		</div>
	</body>
</html>