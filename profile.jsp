<%@ include file="/WEB-INF/jsp/include.jsp"%>
<html>
	
	<c:import var="head" url="/WEB-INF/jsp/head.jsp" />
	${head}
	<body>
		<div id="profilePicLarge">
			<div id="profilePicLargeBG" onclick="document.getElementById('profilePicLarge').style.display='none';"></div>
			<div id="profilePicLargePicture">
				<img src="<c:url value="/ppic?id=${profileuser.id}&size=2"/>">
				<div class="playButton" onclick="this.firstChild.play()"><audio src="${profileUser.audioURL}"></audio></div>
			</div>
		</div>
		<div class="container">
			<c:import var="top" url="/WEB-INF/jsp/top.jsp" />
			${top}
			<div class="content">
				<div id="rightProfile">
					<c:choose>
						<c:when test="${user.id eq profileuser.id}">
							<input type="button" class="button editBtn" onclick="window.location.href = 'editprofile'" value="Edit profile" />
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${follow}">
									<input type="button" class="button editBtn" onmouseover="if(this.value!='\u002B Follow'){this.value = '\u2717 Unfollow';this.className = 'button unfollowBtn'}" onmouseout="if(this.value!='\u002B Follow'){this.value = '\u2713 Following';this.className = 'button editBtn'}" onclick="follow(this, '${profileuser.profileAdress}');" value="&#x2713; Following" />
								</c:when>
								<c:otherwise>
									<input type="button" class="button followBtn" onmouseover="if(this.value!='\u002B Follow'){this.value = '\u2717 Unfollow';this.className = 'button unfollowBtn'}" onmouseout="if(this.value!='\u002B Follow'){this.value = '\u2713 Following';this.className = 'button editBtn'}" onclick="follow(this, '${profileuser.profileAdress}');" value="&#x2b; Follow" />
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
					<br/>
					<div class="profileInfo" class="tabs">
						<ul class="tabs">
							<a class="profileLink defaulttab" href="#posts" rel="#posts"><li>${nrOfPosts}<br/><span>Posts</span></li></a>
							<a class="profileLink" href="#favorites" rel="#favorites"><li>${nrOfLikes}<br/><span>Favorites</span></li></a>
							<a class="profileLink" href="#followers" rel="#followers" id="followerstab"><li>${followers}<br/><span>Followers</span></li></a>
							<a class="profileLink" href="#following" rel="#following" id="followingtab"><li>${follows}<br/><span>Following</span></li></a>
						</ul>
					</div>
				</div>
				<div id="leftProfile">
					<div class="bio">
						<img src="<c:url value="/ppic?id=${profileuser.id}&size=1"/>" class="profilePic" onclick="document.getElementById('profilePicLarge').style.display='block';"> 
						<h2><c:out value="${profileuser.fname} ${profileuser.lname}"/></h2> 
						<span><c:out value="${profileuser.bio}"/></span>
					</div>
				</div>
				<br clear="all"/>
				<hr>
				<div class="profileContent">
					<div class="tab-content" id="posts">
						<c:choose>
							<c:when test="${empty posts}">
								<p><c:out value="${profileuser.fname}"/> has not posted anything yet.</p>
							</c:when>
							<c:otherwise>
								<c:forEach var="image" items="${posts}">
									<div class="image">
										<a href="<c:url value="/post?id=${image.postID}"/>">
											<img src="${image.imageURL}" alt="${image.title}" border="0"/>
											<span><c:out value="${image.title}"/></span>
										</a>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="tab-content" id="favorites">
						<c:choose>
							<c:when test="${empty likes}">
								<p><c:out value="${profileuser.fname}"/> has not piced anything yet.</p>
							</c:when>
							<c:otherwise>
								<c:forEach var="like" items="${likes}">
									<div class="image">
										<a href="<c:url value="/post?id=${like.postID}"/>">
											<img src="${like.imageURL}" alt="<c:out value="${like.title}"/>" border="0"/>
											<span><c:out value="${like.title}"/></span>
										</a>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="tab-content" id="followers">
						<img src="public_html/img/loading.gif" id="loadingGif" />
					</div>
					<div class="tab-content" id="following">
						<img src="public_html/img/loading.gif" id="loadingGif" />
					</div>
				</div>
			</div>
		</div>
	</body>
</html>