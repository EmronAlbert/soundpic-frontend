<%@ include file="/WEB-INF/jsp/include.jsp"%>
<html>

	<c:import var="head" url="/WEB-INF/jsp/head.jsp" />
	${head}
	</head>
	<body>
		<div class="container">
			<c:import var="top" url="/WEB-INF/jsp/top.jsp" />
			${top}
			<div class="content">
				<div>
					<h2>Settings</h2>
					<hr>
					<form name="submit" action="settings" method="post">
						<h3>Privacy</h3>
						<table class="settingsTable" cellspacing="0" width="100%">
							<tr>
								<td align="right"><b>Private profile</b></td>
								<td width="75%"><c:choose>
										<c:when test="${user.privateProfile}">
											<input type="radio" name="private" value="true" checked>On
											<input type="radio" name="private" value="false">Off (everyone can see your profile)
								</c:when>
										<c:otherwise>
											<input type="radio" name="private" value="true">On
											<input type="radio" name="private" value="false" checked>Off (everyone can see your profile)
								</c:otherwise>
									</c:choose></td>
							</tr>
						</table>
						<hr>
						<h3>Account</h3>
						<table class="settingsTable" cellspacing="0" width="100%">
							<tr>
								<td align="right"><b>Update e-mail</b></td>
								<td width="75%"><input type="text" size="35" name="newEmail" value="${user.email}"><br>
								</td>
							</tr>
							<tr>
								<td>
									&nbsp;
								</td>
							</tr>
							<tr>
								<td align="right"><b>New password</b></td>
								<td width="75%"><input type="password" size="35" name="newpass"></td>
							</tr>
							<tr>
								<td align="right"><b>Confirm password</b></td>
								<td width="75%"><input type="password" size="35" name="confirmpass"></td>
							</tr>
							<tr>
								<td align="right"><b>Old password</b></td>
								<td width="75%"><input type="password" size="35"
									name="oldpass"></td>
							</tr>
							
							<tr>
								<td align="right"></td>
								<td width="75%"><br /> <a href="<c:url value="/removeuser"/>">Remove account</a></td>
							</tr>
						</table>
						<hr>
						<h3>Notifications</h3>
						<table class="settingsTable" cellspacing="0" width="100%">
							<tr>
								<td align="right"><b>Email notifications</b></td>
								<td width="75%"><c:choose>
										<c:when test="${user.notification=='true'}">
											<input type="radio" name="allowNotifications" value="true" checked>On <input type="radio" name="allowNotifications" value="false">Off
								</c:when>
										<c:otherwise>
											<input type="radio" name="allowNotifications" value="true">On <input type="radio" name="allowNotifications" value="false" checked>Off
								</c:otherwise>
									</c:choose></td>
							</tr>
						</table>
						<hr>
						<div class="submitSettings">
	
							<input type="submit" name="submitBtn" value="Save Changes"><br>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>