<%@ include file="/WEB-INF/jsp/include.jsp"%>
<link rel="stylesheet" type="text/css"
	href="public_html/styles/comments.css">

<script>
	function httpGet(theUrl){
		var xmlHttp = null;
		xmlHttp = new XMLHttpRequest();
		xmlHttp.open("GET", theUrl, false);
		xmlHttp.send( null );
		return false;
	}

	
	function record${postID}() {
		Wami.setup("wami${postID}");
        Wami.startRecording("<c:url value="/comment?user=${user}&postID=${postID}"/>");
        status("Recording...");
	}

	function play${postID}() {
        Wami.startPlaying("<c:url value="/listen.wav"/>");
        status("Playing...");
	}

	function stop${postID}() {
        status("");
        Wami.stopRecording();
        Wami.stopPlaying();
	}
	
	function comment${postID}(){
		
		
		httpGet('makecomment');
		status("Your comment has been submitted");
	}

	function status(msg) {
        document.getElementById('status${postID}').innerHTML = msg;
	}
</script>
<div id="commentDiv">
	<input type="button" value="Record" onclick="record${postID}()"  class="commentbutton"></input> 
	<input type="button" value="Stop" onclick="stop${postID}()"  class="commentbutton"></input> 
	<input type="button" value="Play" onclick="play${postID}()"  class="commentbutton"></input>
	
	<input type="submit" value="Comment" onclick="comment${postID}()" class="commentbutton"></input>
	
	<br clear="all">
	<div id="status${postID}" style="color:black;"></div>
	<div id="wami${postID}">.</div>
	<noscript>WAMI requires Javascript</noscript>

</div>