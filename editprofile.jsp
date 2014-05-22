<%@ include file="/WEB-INF/jsp/include.jsp"%>

<html>
	<c:import var="head" url="/WEB-INF/jsp/head.jsp" />
	${head}
	</head>
<body onload="txt.style.width = ((txt.value.length + 1) * 10) + 'px'; txt2.style.width = ((txt2.value.length + 1) * 10) + 'px'; asdf(200,200);">
	<div class="container">
		<c:import var="top" url="/WEB-INF/jsp/top.jsp" />
		${top}
		<div class="content">
		<form method="post" action="editprofile" enctype="multipart/form-data">
			<div class="editProfile">
				<input type="submit" value="Save" name="saveBtn" style="padding:3px;"/> <span class="help" title="To change your name, simply change it. To change your profile picture, upload an image. Remove a post by pressing the Remove Post button next to the post.">?</span>
			</div>

			<img id="profilePic" src="<c:url value="/ppic?id=${user.id}&size=1"/>"
				alt="Edit your profile picture" class="profilePic"
				name="profilepic" id="profilepic">
			
			<div class="editbio">
				

					<h2>
						<input id="txt" type="text"
							onkeypress="this.style.width = ((this.value.length + 1) * 12) + 'px';"
							value="${user.fname}" class="inputchangeName"
							name="fname"> <input id="txt2" type="text"
							onkeypress="this.style.width = ((this.value.length + 1) * 12) + 'px';"
							value="${user.lname}" class="inputchangeName"
							name="lname">
					</h2>
				

					<textarea id="limitedtextarea" rows="5" cols="75"
						class="inputchange" name="bio"
						onKeyDown="limitText(this.form.limitedtextarea,this.form.countdown,200);"
						onKeyUp="limitText(this.form.limitedtextarea,this.form.countdown,200);">${user.bio}</textarea>
						
						
					 <font size="1">(Maximum characters: 200)<br>
						You have <input readonly type="text" name="countdown" size="3"
						class="inputchangeName" id="count"> characters left.
					</font> Change profile picture<br clear="all" /> <input name="profilepic" type='file' onchange="readURL(this);" accept="image/*" value="Change profile picture"/>
				</div>
			</form>
			
				<br clear="all">
					<c:forEach var="image" items="${posts}">
						<div class="editprofileImages">
						${image.title}
							<img class="images" src="${image.imageURL}" alt="${image.title}">
							<a href="<c:url value="/removepost?id=${image.postID}" />" > <span >Remove post</span></a>
						</div>
					</c:forEach>
			
							
					<br clear="all">
				</div>
				<script>
					function readURL(input) {
						if (input.files && input.files[0]) {
							var reader = new FileReader();

							reader.onload = function(e) {
								$('#profilePic').attr('src', e.target.result)
										.width(150).height(200);
							};

							reader.readAsDataURL(input.files[0]);
						}
					}
				</script>

			</div>
</body>
</html>