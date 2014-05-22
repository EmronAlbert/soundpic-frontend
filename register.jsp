<%@ include file="/WEB-INF/jsp/include.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<title>SoundPic</title>
		<link rel="stylesheet" type="text/css" href="public_html/styles/login.css">
		<link rel="shortcut icon" type="image/x-icon" href="public_html/img/favicon.ico">
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="public_html/js/bootstrap.min.js"></script>
		<script src="public_html/js/nod.js"></script>
	</head>
	<body>
		<div class="loginform">
		<h1>Sign up</h1>
		<br />
			<form name="register" action="register" id="register" method="post">
			
				<div class="control-group">
					<div class="controls">
						<c:choose>
						<c:when test="${not empty fName}">
							<input type="text" name="fName" id="fName" value="${fName}"/>
							<input type="text" name="lName" id="lName" value="${lName}"/>
						</c:when>
						<c:otherwise>
							<input type="text" name="fName" id="fName" placeholder="First name" />
							<input type="text" name="lName" id="lName" placeholder="Last name" />
						</c:otherwise>
						</c:choose>
					</div>
					<div class="controls">
						<c:choose>
						<c:when test="${not empty email}">
							<input type="text" name="email" id="email" value="${email}"/>
							<input type="text" name="confirmEmail" id="confirmEmail" value="${email}"/>
						</c:when>
						<c:otherwise>
							<input type="text" name="email" id="email" placeholder="Email address" />
							<input type="text" name="confirmEmail" id="confirmEmail" placeholder="Confirm email address" />
						</c:otherwise>
						</c:choose>
					</div>
					<div class="controls">
						<input type="password" id="password" name="password" placeholder="Password" />
						<input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm password" />
					</div>
				</div>

				<div class="leftAlign">
					<input type="checkbox" id="tos" name="terms">I agree to the <a href="tos"><u>Terms of service</u></a>
				</div>
					
				<div class="controls">
					<input type="submit" class="btn" id="registerBtn" value="Create my account">
				</div>

				<script>
				  var metrics = [
					['#fName', 'between:2:32', '<img src="public_html/img/errorArrow.png"> Your first name has to be between 2-32 characters'],
					['#lName', 'between:2:32', '<img src="public_html/img/errorArrow.png"> Your last name has to be between 2-32 characters'],
					['#email', 'email', '<img src="public_html/img/errorArrow.png"> Please enter a valid email address'],
					['#confirmEmail', 'same-as:#email', '<img src="public_html/img/errorArrow.png"> Your email\'s don\'t match'],
					['#password', 'min-length:6', '<img src="public_html/img/errorArrow.png"> Your password has to be at least 6 characters'],
					['#confirmPassword', 'same-as:#password', '<img src="public_html/img/errorArrow.png"> Your passwords don\'t match'],
					['#tos', 'presence', 'You must accept our terms of service to create an account']
				  ];
				  $("#register").nod(metrics);
				</script>

			</form>
			<br/>
			<div class="leftAlign">
				<a href="login">&laquo; Back to login</a>
			</div>
		</div>
	</body>
</html>