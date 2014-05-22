<%@ include file="/WEB-INF/jsp/include.jsp" %>
<!doctype html>
<html>
<head>
	<title>SoundPic</title>
	<link rel="stylesheet" type="text/css" href="public_html/styles/login.css">
	<link rel="shortcut icon" type="image/x-icon" href="public_html/img/favicon.ico">
</head>
<body>
	<div class="loginform">
		<form name="login" action="j_spring_security_check" method="post">
			<h1><img src="public_html/img/logo-square.png" border="0" alt="SoundPic" /></h1>
			<c:if test="${error}"> <p class="errorMessage">Wrong username or password</p></c:if>
			<input type="text" name="j_username" placeholder="Email" /><br>
			<input type="password" name="j_password" placeholder="Password" /><br>
			<input type="submit" name="loginBtn" value="Sign in"/><br>
			<div class="rememberBox">
				<label><input type="checkbox" name="remember">Remember me</label> &bull; <a href="forgotpassword">Forgot password?</a> &bull; <b><a href="register">Sign up</a></b>
			</div>
		</form>
	</div>
</body>
</html>

