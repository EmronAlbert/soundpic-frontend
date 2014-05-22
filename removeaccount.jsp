<html>
	<head>
		<title>SoundPic</title>
		<link rel="stylesheet" type="text/css" href="public_html/styles/css.css">
		<link rel="stylesheet" type="text/css" href="public_html/styles/header.css">
		<link rel="stylesheet" type="text/css" href="public_html/styles/settings.css">
		<link rel="shortcut icon" type="image/x-icon" href="public_html/img/favicon.ico">
		<script src="public_html/js/jquery.min.js"></script>
		<script src="public_html/js/bootstrap.min.js"></script>
		<script src="public_html/js/nod.js"></script>
		<link rel="stylesheet" href="public_html/styles/lionbars.css" type="text/css" />
		<script src="public_html/js/jquery.min.js"></script>
		<script src="public_html/js/jquery.lionbars.0.3.js"></script>
		<script type="text/javascript">
		var openDiv;

		function toggleDiv(divID) {
			$("#" + divID).fadeToggle(50, function() {
				openDiv = $(this).is(':visible') ? divID : null;
			});
		}

		$(document).click(function(e) {
			if (!$(e.target).closest('#'+openDiv).length) {
				toggleDiv(openDiv);
			}
		});  

		</script>		
	</head>
	<body>
		<div class="container">
			<c:import var="top" url="/WEB-INF/jsp/top.jsp">
				<c:param name="username" value="${user.fname} ${user.lname}" />
				<c:param name="userppic" value="${user.profileImage}" />
				<c:param name="userAdress" value="${user.profileAdress}"/>
			</c:import>
			<c:out value="${top}" escapeXml="false" />
			<div class="content">
			<div>
				<h2>Remove account</h2>
				<hr>
				Are you sure?<br /><br />
				Password: <input type="password" /><br />
				<input type="button" value="Confirm" onclick="self.location.href = 'login';"/>
				</div>
			</div>
		</div>
	</body>
</html>