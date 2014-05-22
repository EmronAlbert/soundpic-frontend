<%@ include file="/WEB-INF/jsp/include.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
	<c:when test="${empty followers}">
		<p id="noFollowers">Sorry, no follower.</p>
	</c:when>
	<c:otherwise>
		<c:set var="followerIndex" value="0" />
			<c:forEach var="follower" items="${followers}">
			<ul class="follower">
				<li><a href="<c:url value="${follower.profileAdress}"/>" class="profile"><div class="profileImg" style="background-image: url('<c:url value="/ppic?id=${follower.id}&size=1"/>');"></div>
							<c:choose>
								<c:when test="${user.id eq follower.id}">
									${follower.fname} ${follower.lname} (you!)
								</c:when>
								<c:otherwise>
									${follower.fname} ${follower.lname}
								</c:otherwise>
							</c:choose>
					</a>
				</li>
				<li class="followerBio"> - 
						<c:choose>
							<c:when test="${fn:length(follower.bio) > 100}">
								${fn:substring(follower.bio, 0, 100)}...
							</c:when>
							<c:otherwise>
								${follower.bio}
							</c:otherwise>
						</c:choose>
				</li>
				<c:if test="${user.id ne follower.id}">
					<c:choose>
						<c:when test="${follow[followerIndex]}">
							<input type="button" class="followerListBtn editBtn" onmouseover="if(this.value!='\u002B Follow'){this.value = '\u2717 Unfollow';this.className = 'followerListBtn unfollowBtn'}" onmouseout="if(this.value!='\u002B Follow'){this.value = '\u2713 Following';this.className = 'followerListBtn editBtn'}" onclick="follow(this, '${follower.profileAdress}');" value="&#x2713; Following" />
						</c:when>
						<c:otherwise>
							<input type="button" class="followerListBtn followBtn" onmouseover="if(this.value!='\u002B Follow'){this.value = '\u2717 Unfollow';this.className = 'followerListBtn unfollowBtn'}" onmouseout="if(this.value!='\u002B Follow'){this.value = '\u2713 Following';this.className = 'followerListBtn editBtn'}" onclick="follow(this, '${follower.profileAdress}');" value="&#x2b; Follow" />
						</c:otherwise>
					</c:choose>
				</c:if>
				<br clear="all"/>
			</ul>
			<c:set var="followerIndex" value="${followerIndex + 1}"/>
		</c:forEach>
	</c:otherwise>
</c:choose>