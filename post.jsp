<%@ include file="/WEB-INF/jsp/include.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
	<head>
		<title>SoundPic</title>
		<link rel="stylesheet" type="text/css" href="public_html/styles/css.css">
		<link rel="stylesheet" type="text/css" href="public_html/styles/header.css">
		<link rel="stylesheet" type="text/css" href="public_html/styles/feed.css">
		<link rel="shortcut icon" type="image/x-icon" href="public_html/img/favicon.ico">
		
	</head>
	
	<body>
		<div class="container" id="container">
		<c:import var="top" url="/WEB-INF/jsp/top.jsp" />
		${top}
			<div class="content">
			
				<div class="postContainer">
					<div class="authorBox">
						<div class="name">
							<a href="${post.person.fname}.${post.person.lname}"><img src="<c:url value='/ppic?id=${post.person.id}&size=0'/>" border="0" style="padding-right:5px">${post.person.fname} ${post.person.lname}</a>
						</div>
						
						<div class="dateStamp">
							<img src="public_html/img/clock.png" border="0"> <c:out value="${post.time}"/>
						</div>
						<span class="clear"></span>
					</div>
					<div class="imageContainer">
						<img src="${post.imageURL}">
						<div class="playButton" onclick="this.firstChild.play()"><audio src="${post.audioURL}"></audio></div>
						<div class="likeButton"></div>
					</div>
					<div class="authorBoxBottom">
						<div style="float:left;">
							<h2 class="title"><a href="#">${post.title}</a></h2>
							<span class="tags">
							<c:forEach var="tag" items="${post.tags}">
								<a href="#">${tag.tagString}</a>
							</c:forEach>
							&nbsp;
							</span>
						</div>
						<div class="right">
							<a href="<c:url value='/like?post=${post.postID}&person=${user.id}' />"><img src="public_html/img/pickit.png" alt="Like this post" height="24" width="64"></a><br/>
							<a href="#">${fn:length(post.likes)} pic's</a> | <a href="#">${fn:length(post.comments)} comments</a>
						</div>
						<span class="clear"></span>
					</div>
					<div class="commentContainer">
					<c:forEach var="c" items="${post.comments}">
						<div class="comment">
							<div class="name">
								<a href="${c.person.profileAdress}"><img src="${c.person.profileImageSmall}" border="0" style="padding-right:5px">${c.person.fname} ${c.person.lname}</a>
							</div>
							<audio controls>
								<source src="${c.audioURL}" type="audio/mpeg">
								Your browser does not support the audio element.
								</source>
							</audio>
						</div>
						<hr>
						</c:forEach>
					<span class="clear"></span>
					</div>
				</div>
				
				<br>
				<br clear="all">
				
				<br clear="all">
			</div>
		</div>
	</body>
</html>