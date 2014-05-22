<%@ include file="/WEB-INF/jsp/include.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
	
	<c:import var="head" url="/WEB-INF/jsp/head.jsp" />
	${head}
	</head>
	<body>
		<div class="container">
			<c:import var="top" url="/WEB-INF/jsp/top.jsp" />
			${top}
			<div class="content">
				<div class="searchChoice" id="tabs">
					<h2>You searched for "${searchstring}"</h2>	
					<ul class="tabs">
						<a class="searchTab defaulttab" href="#people" rel="#people"><li>People</li></a>
						<a class="searchTab" href="#tags" rel="#tags"><li>Tags</li></a>
					</ul>
				</div>
				<br clear="all" />
				<br />
				
				<div id="searchResult">
					<div class="tab-content selected" id="people">
					<c:choose>
						<c:when test="${empty searchresult}">
							<p id="noFollowers">Sorry, no results on people.</p>
						</c:when>
						<c:otherwise>
							<c:set var="followerIndex" value="0" />
								<c:forEach var="person" items="${searchresult}">
									<div class="follower">
										<a href="${person.profileAdress}"><img src="<c:url value="/ppic?id=${person.id}&size=0"/>" border="0" width="25"><span class="followerName">
											<c:choose>
												<c:when test="${user.id eq person.id}">
													${person.fname} ${person.lname} (you!)
												</c:when>
												<c:otherwise>
													${person.fname} ${person.lname}
												</c:otherwise>
											</c:choose>
										</span></a>
										<span class="followerBio"> -
											<c:choose>
												<c:when test="${fn:length(person.bio) > 100}">
													${fn:substring(person.bio, 0, 100)}...
												</c:when>
												<c:otherwise>
													${person.bio}
												</c:otherwise>
											</c:choose>
										</span>
										<c:if test="${user.id ne person.id}">
											<c:choose>
												<c:when test="${follow[followerIndex]}">
													<input type="button" class="followerListBtn editBtn" onmouseover="if(this.value!='\u002B Follow'){this.value = '\u2717 Unfollow';this.className = 'followerListBtn unfollowBtn'}" onmouseout="if(this.value!='\u002B Follow'){this.value = '\u2713 Following';this.className = 'followerListBtn editBtn'}" onclick="follow(this, '${person.profileAdress}');" value="&#x2713; Following" />
												</c:when>
												<c:otherwise>
													<input type="button" class="followerListBtn followBtn" onmouseover="if(this.value!='\u002B Follow'){this.value = '\u2717 Unfollow';this.className = 'followerListBtn unfollowBtn'}" onmouseout="if(this.value!='\u002B Follow'){this.value = '\u2713 Following';this.className = 'followerListBtn editBtn'}" onclick="follow(this, '${person.profileAdress}');" value="&#x2b; Follow" />
												</c:otherwise>
											</c:choose>
										</c:if>
										<br clear="all"/>
									</div>
								<c:set var="followerIndex" value="${followerIndex + 1}"/>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					
					</div>
					<div class="tab-content" id="tags">
						<c:choose>
							<c:when test="${empty searchresult}">
								<p id="noFollowers">Sorry, no results on tags.</p>
							</c:when>
							<c:otherwise>
								<ul>
									<c:forEach var="post" items="${searchresulttags}">
										<li>
											<c:forEach var="tag" items="${post.tags}">
												<a href="<c:url value="/search?query=${tag.tagString}"/>">${tag.tagString}</a>&nbsp;
											</c:forEach>
										</li>
									</c:forEach>
								</ul>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<br clear="all"> 
			</div>
		</div>
	</body>
</html>