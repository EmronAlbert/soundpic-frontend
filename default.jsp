<%@ include file="/WEB-INF/jsp/include.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<c:import var="head" url="/WEB-INF/jsp/head.jsp" />
	${head}
	</head>

	<body> 

	 <div id="fb-root"></div>
		<div class="container" id="container">
			<c:import var="top" url="/WEB-INF/jsp/top.jsp" />
			${top}
			<div class="content">
			<c:choose>
				<c:when test="${empty posts}">
					<p id="noFollowers">Follow someone to see posts in your feed</p>
				</c:when>
				<c:otherwise>
					<c:set var="likedIndex" value="0" />
					<c:forEach var="image" items="${posts}">
						<div class="postContainer">
							<div class="authorBox">
								<div class="name">
									<a href="${image.person.profileAdress}"><img src="<c:url value='/ppic?id=${image.person.id}&size=0'/>" border="0" style="padding-right:5px">${image.person.fname} ${image.person.lname}</a>
								</div>
								<div class="dateStamp">
									<img src="public_html/img/clock.png" border="0"> <c:out value="${image.time}"/>
								</div>
								<span class="clear"></span>
							</div>
							<div class="imageContainer">
								<img src="<c:url value='/images?id=${image.postID}&size=1'/>">
								<div class="playButton" onclick="this.firstChild.play()"><audio src="${image.audioURL}"></audio></div>
							</div>
							<div class="authorBoxBottom">
								<div style="float:left;">
									<h2 class="title"><a href="<c:url value='/post?id=${image.postID}'/>">${image.title}</a></h2>
									<span class="tags">
									<c:forEach var="tag" items="${image.tags}">
										<a href="#">${tag.tagString}</a>
									</c:forEach>
									&nbsp;
									</span>
								</div>
								<div class="right">
									<div class="fb-like" data-href="http://www.soundpic.se/post?id=${image.postID}" data-send="false" data-layout="button_count" data-show-faces="false" data-font="arial" data-action="recommend"></div>
									<c:choose>
										<c:when test="${liked[likedIndex]}">
											<input type="button" class="picitBtn piced" onmouseover="if(this.value=='Piced!'){this.value = 'Unpic it'}" onmouseout="if(this.value=='Unpic it'){this.value = 'Piced!'}" onclick="picit(this, '${image.postID}', '${user.id}');" value="Piced!" />
										</c:when>
										<c:otherwise>
											<input type="button" class="picitBtn" onclick="picit(this, '${image.postID}', '${user.id}');" value="Pic it!" />
										</c:otherwise>
									</c:choose>
									<br />
									<div style="margin-bottom:10px;">
										<div id="nrOfLikes${image.postID}"></div> | <div id="nrOfComments${image.postID}"></div>
									</div>
								</div>
								<br clear="all">
							</div>

							<div class="commentContainer" id="commentContainer${image.postID}"></div>
							 
							<script>
							$('#commentContainer${image.postID}').load('<c:url value="/comments?postID=${image.postID}"/>');
							$('#nrOfLikes${image.postID}').load('<c:url value="likecount?postID=POSTID"/>');
							$('#nrOfComments${image.postID}').load('<c:url value="commentcount?postID=POSTID"/>');
							</script>
							
							<br clear="all">
							<div class="newCommentContainer">
							<div id="commentText${image.postID}"  onclick="$('#commentBox${image.postID}').load('<c:url value="/comment?user=${user.id}&postID=${image.postID}"/>');">
									<span class="commentText toggleBtn">Comment</span>
								</div>
								<br>
								<div id="commentBox${image.postID}"></div>
							</div>							
							</div>
								<c:set var="likedIndex" value="${likedIndex + 1}"/>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<br clear="all">
			</div>
		</div>
	</body>
</html>