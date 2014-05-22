<html>
	<head>
		<title>SoundPic</title>
		<link rel="stylesheet" type="text/css" href="public_html/styles/css.css">
		<link rel="stylesheet" type="text/css" href="public_html/styles/header.css">
		<link rel="stylesheet" type="text/css" href="public_html/styles/settings.css">
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
				<c:param name="userppic" value="${user.profileImageSmall}" />
				<c:param name="userAdress" value="${user.profileAdress}"/>
			</c:import>
			<c:out value="${top}" escapeXml="false" />
			<div class="content">
			<div>
				<h2>Help</h2>
				<hr>
				
				</div>
			</div>
		</div>
	</body>
</html>