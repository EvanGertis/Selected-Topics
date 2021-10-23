<!DOCTYPE HTML>
<html lang="en">
	<head>
		<title>Word Matching Exercise</title>
		<style>
*:focus {outline: 2px solid blue; outline-offset: 2px;}
		details {padding:3px;}
		</style>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/boxes.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/event1.js"><link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css" /></script>
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-89940905-27"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-1.7.2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.ui.touch-punch.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/event1.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.alerts.js"></script>
<link href="${pageContext.request.contextPath}/static/js/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen"><script type="text/javascript" src="${pageContext.request.contextPath}/static/js/logging.js"></script>
</head>
		<body><div id='maincontentstyle'>
	<center>
		<div id='boxstyle'>
			<h3 id='title'>title</h3>
				<center>
					<div class='source'>
						<div id='s1' class='draggyBox-small ui-draggable'>
							k1
						</div>
						<div id='s2' class='draggyBox-small ui-draggable'>
							k2
						</div>
					</div>
					</center>
					<table id='tablestyle'>
						<tr>
						<td id='row1'>
							<div id='t1' class='ltarget'></div>
						</td >
						<td id='d1'>
							d1
							</td >
						</tr>
						<tr>
						<td id='row2'>
							<div id='t2' class='ltarget'></div>
						</td >
						<td id='d2'>
							d2
							</td >
						</tr>
					</table>
				</center>
		</div>
	</center>
</div><span style="padding: 3px"> <button id ="one" class="button" type="button" onClick="show_answer()">Show Answer</button> <button id = "resetButton" class="button" type="button" onClick="reset()">Reset</button></span>
		</body>
</html>
<script type="text/javascript">$(init);$( window ).unload(function() {removeStorage.removeItem("someVarKey1");});function reset() {  var someVarName = true;sessionStorage.setItem("someVarKey1", someVarName);window.location.reload();}function init() {	document.getElementById('resetButton').style.display = 'none';document.getElementById("resetButton").style.visibility = "hidden";if (false && sessionStorage.getItem("someVarKey1")) // No focus for the first time$("#one").focus();var numbers = [3, 4, 5, 1, 2];initialize(numbers);}</script>  <script>  answer = "Loop Body: is the part of the body that contains the statements to be repeated.
Iteration: is one time execution of the loop body.
Loop Continuation Condition: is a Boolean expression that controls the execution of the loop.
Infinite Loop: is a loop that runs forever due to an error in the code.
Off-by-one: is an error in the program that causes the loop body to be executed one more or less time."  function show_answer() {	  jAlert(answer, 'Correct Match');  }</script> <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/GetElementPosition3.js"></script> <script>//    $(function(){//  if ('speechSynthesis' in window) {//    speechSynthesis.onvoiceschanged = function() {//      var $voicelist = $('#voices');////      if($voicelist.find('option').length == 0) {//        speechSynthesis.getVoices().forEach(function(voice, 'index) {//          var $option = $('<option>')//          .val(index)//          .html(voice.name + (voice.default ? ' (default)' :''));////          $voicelist.append($option);//        });////        $voicelist.material_select();//      }//    }//  } //});     audioOn = false;$(function() {$('.menulink').click(function(){  if (audioOn) {	$("#bg").attr('src',"audioOff.png");  	audioOn = false;  }  else {	$("#bg").attr('src',"audioOn.png");	audioOn = true; speak(" ");  }  return false;});}); </script>   