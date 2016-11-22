<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<head>
	<title>Home</title>
</head>
<style type="text/css">
	*{
		margin: 0;
		padding: 0;
	}
	body{
	background-color: black;
	}
	.fly-in-text{
		list-style: none;
		position: absolute;
		left: 50%;
		top:50%;
		transform: translateX(-50%) translateY(-50%);
	}
	.fly-in-text li{
		display: inline-block;
		margin-right: 20px;
		font-family: Open Sans, Arial;
		font-weight: 300;
		font-size: 4em;
		color: #fff;
		opacity: 1;
		transition: all 2.5s ease;
	}
	.fly-in-text li:LAST-CHILD {
		margin-right: 0;
	}
	.fly-in-text.hidden li{
		 opacity: 0; 
	}
	.fly-in-text.hidden li:NTH-CHILD(1) {transform: translateX(-200px) translateY(-200px);}
	.fly-in-text.hidden li:NTH-CHILD(2) {transform: translateX(20px) translateY(100px);}
	.fly-in-text.hidden li:NTH-CHILD(3) {transform: translateX(-150px) translateY(-80px);}
	.fly-in-text.hidden li:NTH-CHILD(4) {transform: translateX(10px) translateY(-200px);}
	.fly-in-text.hidden li:NTH-CHILD(5) {transform: translateX(-330px) translateY(200px);}
	.fly-in-text.hidden li:NTH-CHILD(6) {transform: translateX(20px) translateY(-20px);}
	.fly-in-text.hidden li:NTH-CHILD(7) {transform: translateX(30px) translateY(280px);}
	.fly-in-text.hidden li:NTH-CHILD(8) {transform: translateX(-120px) translateY(100px);}
	.fly-in-text.hidden li:NTH-CHILD(9) {transform: translateX(200px) translateY(-130px);}
	.fly-in-text.hidden li:NTH-CHILD(10) {transform: translateX(150px) translateY(-80px);}
	.fly-in-text.hidden li:NTH-CHILD(11) {transform: translateX(-20px) translateY(30px);}
</style>
<script type="text/javascript">
	$(function() {
		 setTimeout(function () {
			$('.fly-in-text').removeClass('hidden');
		},500);
		 setTimeout(function () {
			 location.href="index";
		},3000);
	});
</script>
<body>
	<ul class="fly-in-text hidden">
				<li>H</li>
				<li>E</li>
				<li>L</li>
				<li>L</li>
				<li>O</li>
				<li></li>
				<li>W</li>
				<li>O</li>
				<li>R</li>
				<li>L</li>
				<li>D</li>
			</ul>
</body>
</html>
