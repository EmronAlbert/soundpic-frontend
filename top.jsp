<%@ include file="/WEB-INF/jsp/include.jsp" %>
<div class="menuContainer">
	<div class="menu">
		<ul>
			<c:choose>
				<c:when test="${empty user}">
					<form name="login" action="j_spring_security_check" method="post">
						<li style="float:left;">
							<input type="text" name="j_username" class="loginInput" placeholder="Email" />
						</li>
						<li style="float:left;">
							<input type="password" name="j_password" class="loginInput" placeholder="Password" />
						</li>
						<li style="float:left;">
							<input type="submit" name="loginBtn" class="loginInput" value="Sign in"/>
						</li>
					</form>
				</c:when>
				<c:otherwise>
					<li style="float:left;"><a href="<c:url value="${user.profileAdress}"/>" class="profile"><div class="profileImg" style="background-image: url('<c:url value="/ppic?id=${user.id}&size=1"/>');"></div>${user.fname} ${user.lname}</a></li>
					<li style="float:left;">
						<div id="notificationIcon" class="menuIcon">
							<img src="public_html/img/notifications.png" border="0" class="toggleBtn" onclick="toggleDiv('notificationContainer');">
						</div>
						<div id="notificationContainer">
							<img class="arrow" src="public_html/img/notificationArrow.png"/>
							<img src="public_html/img/loading.gif" id="loadingGif" />
						</div>
						<script>
							$('#notificationContainer').lionbars();
						</script>
					</li>
					<li style="float:right;">
						<div id="settingsIcon" class="menuIcon">
							<img src="public_html/img/settingsbutton.png" border="0" class="toggleBtn" onclick="toggleDiv('settingsContainer');">
						</div>
						<div id="settingsContainer" class="settingsContainer animated">
							<img class="arrow" src="public_html/img/notificationArrow.png"/>
							<ul>
								<a href="settings"><li>Settings</li></a>
								<a href="help"><li>Help</li></a>
								<a href="logout"><li>Logout</li></a>
							</ul>
						</div>
					</li>
				</c:otherwise>
			</c:choose>
			<li style="float:right;">
				<form action="search" method="get" onsubmit="return checkCharCount();">
					<input id="searchBox" type="text" name="query" placeholder="Search #tags or names" />
					<input type="image" class="searchBtn" src="public_html/img/search.png" style="border:0; position:absolute; margin-left:-40px; margin-top:-17px; height:15px;"/>
				</form>
			</li>
			<li style="float:right; margin-right:160px;">
				<a href="<c:url value="/"/>">
					<img src="public_html/img/logo.png" id="logo" border="0" alt="SoundPic">
				</a>
			</li>
		</ul>
	</div>
</div>