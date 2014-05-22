<%@ include file="/WEB-INF/jsp/include.jsp" %>
<head>
	<title>SoundPic</title>
	<link rel="stylesheet" type="text/css" href="public_html/styles/css.css">
	<link rel="stylesheet" type="text/css" href="public_html/styles/header.css">
	<link rel="stylesheet" type="text/css" href="public_html/styles/feed.css">
	<link rel="stylesheet" type="text/css" href="public_html/styles/search.css">
	<link rel="stylesheet" type="text/css" href="public_html/styles/profile.css">
	<link rel="stylesheet" type="text/css" href="public_html/styles/settings.css">
	<link rel="stylesheet" type="text/css" href="public_html/styles/editProfile.css">
	<link rel="stylesheet" type="text/css" href="public_html/styles/animate.css">
	<link rel="shortcut icon" type="image/x-icon" href="public_html/img/favicon.ico">
	<link rel="stylesheet" href="public_html/styles/lionbars.css" type="text/css" />
	<script src="public_html/js/jquery-1.7.js"></script>
	<!-- <script src="http://code.jquery.com/jquery-latest.js"></script> -->
	<script src="public_html/js/jquery.lionbars.0.3.js"></script>
	<script src="public_html/js/editprofile.js"></script>
	<script type="text/javascript" src="http://static.ak.fbcdn.net/connect.php/js/FB.Share"></script>
	<!-- swfobject is a commonly used library to embed Flash content -->
	<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/swfobject/2.2/swfobject.js"></script>

	<!-- Setup the recorder interface -->
	<script type="text/javascript" src="public_html/wami/recorder.js"></script>

	<script>
	/*	Script för notifikationsrutan */
	var openDiv;

	function toggleDiv(divID) {
		if ($("#" + divID).is(":hidden"))
		    openDiv = divID;
	    else
		    openDiv = null;
		$("#" + divID).fadeToggle(200);
	}
	
	$(document).click(function(e){
	    if (!$(e.target).is('"#" + openDiv, .toggleBtn')) {
	        $("#" + openDiv).fadeToggle(200);
	        openDiv = null;
	    }

    });


	window.setTimeout(function() {
		 $('#notificationIcon').load('notificationcount');
	},0);
	setInterval(function() {
		 $('#notificationIcon').load('notificationcount');
	},10000);
	
	$(function() {
		$("#notificationIcon").on("click", function() {
			if ($("#notificationContainer").is(":visible")){
				$("#notificationContainer").load("notifications", function() {
					$('#notificationIcon').load('notificationcount');
				});
				return false;
			}
		})
	});
	
	/*	Script för HTTP GET Requests */
	function httpGet(theUrl){
		var xmlHttp = null;

		xmlHttp = new XMLHttpRequest();
		xmlHttp.open("GET", theUrl, false);
		xmlHttp.send( null );
		return false;
	}
	
	/*	Script för minsta antal tecken i sökrutan */
	function checkCharCount() {
		var value = document.getElementById('searchBox').value;
		if (value.length < 3) {
			alert("Your search query has to be at least 3 characters long.");
			return false;
		}
	}
	
	/*	Script för att förkorta biografin i följar- samt söklistan */
	function shortenString(str){
		if(str.length > 25) {
			str = str.substring(0,24)+"...";
		}
	}

	/*	Script för tabbarna på profilsidan */
	$(document).ready(function () {
		$('.tabs a').click(function () {
			var $this = $(this);
			$('.tabs a').removeClass("selected");
			$this.addClass('selected');
			switch_tabs($this.attr('href'));
			return false;
		});
		var anchor;
		var hash = $('a[href="' + location.hash + '"]');
		if(hash.length > 0){
			anchor = hash;
		}
		else{
			anchor = $('.defaulttab');
		}
		anchor.click();
	});

	function switch_tabs(hash) {
		$('.tab-content').hide(); 
		$(hash).show();   
		location.hash = hash;
		if(hash == "#following"){
			$('#following').load('following?profileAdress=${profileuser.profileAdress}');
			$('#followers').load('loading}');
		}
		if(hash == "#followers"){
			$('#followers').load('followers?profileAdress=${profileuser.profileAdress}');
			$('#following').load('loading}');
		}
	};
	
	/*	Facebookintegration genom rekommendationsknapp */
	(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
	
	
	function follow(btn, person){
		if (btn.value=="\u2717 Unfollow"){
			btn.value = "\u002B Follow";
			if(btn.className == "followerListBtn unfollowBtn")
				btn.className = "followerListBtn followBtn";
			else
				btn.className = "button followBtn";
			httpGet('<c:url value="/unfollow?profileAdress='+person+'"/>');
			
		}else if (btn.value=="\u002B Follow"){
			btn.value = "\u2717 Unfollow";
			if(btn.className == "followerListBtn followBtn")
				btn.className = "followerListBtn unfollowBtn";
			else
				btn.className = "button unfollowBtn";
			httpGet('<c:url value="/follow?profileAdress='+person+'"/>');
		}else{
			return false;
		}
	}
	function picit(btn, post, person){
		if (btn.value=="Unpic it"){
			httpGet('<c:url value="/unlike?post='+post+'&person='+person+'"/>');
			btn.value = "Pic it!";
			btn.className = "picitBtn";
			btn.style.background = "#eee url('<c:url value='/public_html/img/picit.png'/>') no-repeat 5% center";
		}else{
			httpGet('<c:url value="/like?post='+post+'&person='+person+'"/>');
			btn.value = "Piced!";
			btn.className = "picitBtn piced";
			btn.style.background = "#eee url('<c:url value='/public_html/img/piced.png'/>') no-repeat 5% center";
		}
	}
	
	</script>