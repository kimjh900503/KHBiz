<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<!-- Favicon -->
<link rel="shortcut icon" href="/erp/images/favicon.ico">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.js"></script>
<link href="/erp/css/bootstrap.css" rel="stylesheet" />
<link href="//cdnjs.cloudflare.com/ajax/libs/animate.css/3.1.1/animate.min.css" rel="stylesheet" />
<link href="/erp/css/navi.css" rel="stylesheet" />
<link href="/erp/css/main.css" rel="stylesheet" />
<!-- Count To javascript -->
<script type="text/javascript" src="/erp/js/jquery.countTo.js"></script>
<script type="text/javascript">
	$(function() {
		var height = $('body').height();
		var docH       = $(document).height();
	    var wHeight    = $(window).height();
		var newHeight = $(window).height();
	    var scrollBtm  = docH - wHeight;
	    $('.parallax-bg').css("height",newHeight+"px");
	    $('body').scrollspy({
	        target: '.navbar-fixed-top',
	        offset: 60
	    });
	    $('#topNav').affix({
	        offset: {
	            top: 200
	        }
	    });
	    $('.navbar-collapse ul li a').click(function() {
	        /* always close responsive nav after click */
	        $('.navbar-toggle:visible').click();
	    });
	});
</script>
</head>
<body>
	<nav id="topNav" class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand page-scroll" href="#first"><i
					class="ion-ios-analytics-outline"></i> Landing Zero</a>
			</div>
			<div class="navbar-collapse collapse" id="bs-navbar">
				<ul class="nav navbar-nav">
					<li><a class="page-scroll" href="#one">Intro</a></li>
					<li><a class="page-scroll" href="#two">Highlights</a></li>
					<li><a class="page-scroll" href="#three">Gallery</a></li>
					<li><a class="page-scroll" href="#four">Features</a></li>
					<li><a class="page-scroll" href="#last">Contact</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#" class="page-scroll"> Sign Up</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a class="page-scroll" data-toggle="modal"
						href="#login-form">Login</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a class="page-scroll" data-toggle="modal"
						title="A free Bootstrap video landing theme" href="#aboutModal">About</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="content" id="first">
		<div class="scrollToTop circle"><i class="icon-up-open-big"></i></div>
		<div class="parallax-bg">
			<video id="video-elem" preload="auto" loop="100" muted="muted" autoplay="autoplay" poster="${pageContext.session.servletContext.contextPath }/images/31a43150.main_image.png">
				<%-- <source
					src="${pageContext.session.servletContext.contextPath }/images/2015121711353535351ba.mp4"
					type="video/mp4">
				<source
					src="${pageContext.session.servletContext.contextPath }/images/201512180103383381qk.mp4"
					type="video/mp4"> --%>
			</video>
			<div class="media video-overlay">
				<div>
					<h2 id="hello">
						<small style="color: #0000a0">HELLO</small><br> JANDI++
					</h2>
					<h1>
						효과적인 업무. 잔디++ 를 시작하세요
					</h1>
					<h3>
						간편한 소통, 원하던 기능을 전부 담았습니다.
					</h3>

				</div>
			</div>
		</div>
	</div>
	<section class="bg-primary" id="one">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2 text-center">
                    <h2 class="margin-top-0 text-primary">Built On The Bootstrap Grid</h2>
                    <br>
                    <p class="text-faded">
                        Bootstrap's responsive grid comes in 4 sizes or "breakpoints": tiny (xs), small(sm), medium(md) and large(lg). These 4 grid sizes enable you create responsive layouts that behave accordingly on different devices.
                    </p>
                    <a href="#three" class="btn btn-default btn-xl page-scroll">Learn More</a>
                </div>
            </div>
        </div>
    </section>
    <section id="two">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="margin-top-0 text-primary">Flexible Layouts</h2>
                    <hr class="primary">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 text-center">
                    <div class="feature">
                        <i class="icon-lg ion-android-laptop wow fadeIn" data-wow-delay=".3s"></i>
                        <h3>Responsive</h3>
                        <p class="text-muted">Your site looks good everywhere</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 text-center">
                    <div class="feature">
                        <i class="icon-lg ion-social-sass wow fadeInUp" data-wow-delay=".2s"></i>
                        <h3>Customizable</h3>
                        <p class="text-muted">Easy to theme and customize with SASS</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 text-center">
                    <div class="feature">
                        <i class="icon-lg ion-ios-star-outline wow fadeIn" data-wow-delay=".3s"></i>
                        <h3>Consistent</h3>
                        <p class="text-muted">A mature, well-tested, stable codebase</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section id="three" class="no-padding">
        <div class="container-fluid">
            <div class="row no-gutter">
                <div class="col-lg-4 col-sm-6">
                    <a href="#galleryModal" class="gallery-box" data-toggle="modal" data-src="//splashbase.s3.amazonaws.com/unsplash/regular/photo-1430916273432-273c2db881a0%3Fq%3D75%26fm%3Djpg%26w%3D1080%26fit%3Dmax%26s%3Df047e8284d2fdc1df0fd57a5d294614d">
                        <img src="//splashbase.s3.amazonaws.com/unsplash/regular/photo-1430916273432-273c2db881a0%3Fq%3D75%26fm%3Djpg%26w%3D1080%26fit%3Dmax%26s%3Df047e8284d2fdc1df0fd57a5d294614d" class="img-responsive" alt="Image 1">
                        <div class="gallery-box-caption">
                            <div class="gallery-box-content">
                                <div>
                                    <i class="icon-lg ion-ios-search"></i>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="#galleryModal" class="gallery-box" data-toggle="modal" data-src="//splashbase.s3.amazonaws.com/getrefe/regular/tumblr_nqune4OGHl1slhhf0o1_1280.jpg">
                        <img src="//splashbase.s3.amazonaws.com/getrefe/regular/tumblr_nqune4OGHl1slhhf0o1_1280.jpg" class="img-responsive" alt="Image 2">
                        <div class="gallery-box-caption">
                            <div class="gallery-box-content">
                                <div>
                                    <i class="icon-lg ion-ios-search"></i>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="#galleryModal" class="gallery-box" data-toggle="modal" data-src="//splashbase.s3.amazonaws.com/unsplash/regular/photo-1433959352364-9314c5b6eb0b%3Fq%3D75%26fm%3Djpg%26w%3D1080%26fit%3Dmax%26s%3D3b9bc6caa190332e91472b6828a120a4">
                        <img src="//splashbase.s3.amazonaws.com/unsplash/regular/photo-1433959352364-9314c5b6eb0b%3Fq%3D75%26fm%3Djpg%26w%3D1080%26fit%3Dmax%26s%3D3b9bc6caa190332e91472b6828a120a4" class="img-responsive" alt="Image 3">
                        <div class="gallery-box-caption">
                            <div class="gallery-box-content">
                                <div>
                                    <i class="icon-lg ion-ios-search"></i>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="#galleryModal" class="gallery-box" data-toggle="modal" data-src="//splashbase.s3.amazonaws.com/lifeofpix/regular/Life-of-Pix-free-stock-photos-moto-drawing-illusion-nabeel-1440x960.jpg">
                        <img src="//splashbase.s3.amazonaws.com/lifeofpix/regular/Life-of-Pix-free-stock-photos-moto-drawing-illusion-nabeel-1440x960.jpg" class="img-responsive" alt="Image 4">
                        <div class="gallery-box-caption">
                            <div class="gallery-box-content">
                                <div>
                                    <i class="icon-lg ion-ios-search"></i>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="#galleryModal" class="gallery-box" data-toggle="modal" data-src="//splashbase.s3.amazonaws.com/lifeofpix/regular/Life-of-Pix-free-stock-photos-new-york-crosswalk-nabeel-1440x960.jpg">
                        <img src="//splashbase.s3.amazonaws.com/lifeofpix/regular/Life-of-Pix-free-stock-photos-new-york-crosswalk-nabeel-1440x960.jpg" class="img-responsive" alt="Image 5">
                        <div class="gallery-box-caption">
                            <div class="gallery-box-content">
                                <div>
                                    <i class="icon-lg ion-ios-search"></i>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="#galleryModal" class="gallery-box" data-toggle="modal" data-src="//splashbase.s3.amazonaws.com/lifeofpix/regular/Life-of-Pix-free-stock-photos-clothes-exotic-travel-nabeel-1440x960.jpg">
                        <img src="//splashbase.s3.amazonaws.com/lifeofpix/regular/Life-of-Pix-free-stock-photos-clothes-exotic-travel-nabeel-1440x960.jpg" class="img-responsive" alt="Image 6">
                        <div class="gallery-box-caption">
                            <div class="gallery-box-content">
                                <div>
                                    <i class="icon-lg ion-ios-search"></i>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </section>
    <section class="container-fluid" id="four">
        <div class="row">
            <div class="col-xs-10 col-xs-offset-1 col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">
                <h2 class="text-center text-primary">Features</h2>
                <hr>
                <div class="media wow fadeInRight">
                    <h3>Simple</h3>
                    <div class="media-body media-middle">
                        <p>What could be easier? Get started fast with this landing page starter theme.</p>
                    </div>
                    <div class="media-right">
                        <i class="icon-lg ion-ios-bolt-outline"></i>
                    </div>
                </div>
                <hr>
                <div class="media wow fadeIn">
                    <h3>Free</h3>
                    <div class="media-left">
                        <a href="#alertModal" data-toggle="modal" data-target="#alertModal"><i class="icon-lg ion-ios-cloud-download-outline"></i></a>
                    </div>
                    <div class="media-body media-middle">
                        <p>Yes, please. Grab it for yourself, and make something awesome with this.</p>
                    </div>
                </div>
                <hr>
                <div class="media wow fadeInRight">
                    <h3>Unique</h3>
                    <div class="media-body media-middle">
                        <p>Because you don't want your Bootstrap site, to look like a Bootstrap site.</p>
                    </div>
                    <div class="media-right">
                        <i class="icon-lg ion-ios-snowy"></i>
                    </div>
                </div>
                <hr>
                <div class="media wow fadeIn">
                    <h3>Popular</h3>
                    <div class="media-left">
                        <i class="icon-lg ion-ios-heart-outline"></i>
                    </div>
                    <div class="media-body media-middle">
                        <p>There's good reason why Bootstrap is the most used frontend framework in the world.</p>
                    </div>
                </div>
                <hr>
                <div class="media wow fadeInRight">
                    <h3>Tested</h3>
                    <div class="media-body media-middle">
                        <p>Bootstrap is matured and well-tested. It's a stable codebase that provides consistency.</p>
                    </div>
                    <div class="media-right">
                        <i class="icon-lg ion-ios-flask-outline"></i>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<footer id="footer">
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-6 col-sm-3 column">
					<h4>Information</h4>
					<ul class="list-unstyled">
						<li><a href="">Products</a></li>
						<li><a href="">Services</a></li>
						<li><a href="">Benefits</a></li>
						<li><a href="">Developers</a></li>
					</ul>
				</div>
				<div class="col-xs-6 col-sm-3 column">
					<h4>About</h4>
					<ul class="list-unstyled">
						<li><a href="#">Contact Us</a></li>
						<li><a href="#">Delivery Information</a></li>
						<li><a href="#">Privacy Policy</a></li>
						<li><a href="#">Terms &amp; Conditions</a></li>
					</ul>
				</div>
				<div class="col-xs-12 col-sm-3 column">
					<h4>Stay Posted</h4>
					<form>
						<div class="form-group">
							<input type="text" class="form-control"
								title="No spam, we promise!" placeholder="Tell us your email">
						</div>
						<div class="form-group">
							<button class="btn btn-primary" data-toggle="modal"
								data-target="#alertModal" type="button">Subscribe for
								updates</button>
						</div>
					</form>
				</div>
				<div class="col-xs-12 col-sm-3 text-right">
					<h4>Follow</h4>
					<ul class="list-inline">
						<li><a rel="nofollow" href="" title="Twitter"><i
								class="icon-lg ion-social-twitter-outline"></i></a>&nbsp;</li>
						<li><a rel="nofollow" href="" title="Facebook"><i
								class="icon-lg ion-social-facebook-outline"></i></a>&nbsp;</li>
						<li><a rel="nofollow" href="" title="Dribble"><i
								class="icon-lg ion-social-dribbble-outline"></i></a></li>
					</ul>
				</div>
			</div>
			<br /> <span class="pull-right text-muted small"><a
				href="http://www.bootstrapzero.com">Landing Zero by
					BootstrapZero</a> ©2015 Company</span>
		</div>
	</footer>
	<div id="aboutModal" class="modal fade in" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<h2 class="text-center">Landing Zero Theme</h2>
					<h5 class="text-center">A free, responsive landing page theme
						built by BootstrapZero.</h5>
					<p class="text-justify">This is a single-page Bootstrap
						template with a sleek dark/grey color scheme, accent color and
						smooth scrolling. There are vertical content sections with subtle
						animations that are activated when scrolled into view using the
						jQuery WOW plugin. There is also a gallery with modals that work
						nicely to showcase your work portfolio. Other features include a
						contact form, email subscribe form, multi-column footer. Uses
						Questrial Google Font and Ionicons.</p>
					<p class="text-center">
						<a href="http://www.bootstrapzero.com">Download at
							BootstrapZero</a>
					</p>
					<br />
					<button class="btn btn-primary btn-lg center-block"
						data-dismiss="modal" aria-hidden="true">OK</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade in" id="login-form" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
		<form class="login-form">
			<div class="form-group has-feedback modal-body">
				<label class="control-label">Username</label> <input type="text"
					class="form-control" placeholder=""> <i
					class="fa fa-user form-control-feedback"></i>
			</div>
			<div class="form-group has-feedback modal-body">
				<label class="control-label">Password</label> <input type="password"
					class="form-control" placeholder=""> <i
					class="fa fa-lock form-control-feedback"></i>
			</div>
			<div class="modal-body text-center">
			<button type="submit" class="btn btn-gray btn-sm" data-dismiss="modal" aria-hidden="true">Log In</button>
			<span class="pl-5 pr-5">or</span>
			<button type="submit" class="btn btn-default btn-sm" data-dismiss="modal" aria-hidden="true">Sing Up</button>
			</div>
			<ul>
				<li class="text-center"><a href="#" data-dismiss="modal" aria-hidden="true">Forgot your password?</a></li>
			</ul>
			<span class="text-center">Login with</span>
			<ul class="social-links circle small colored clearfix">
				<li class="facebook"><a target="_blank"
					href="http://www.facebook.com"><i class="fa fa-facebook"></i></a></li>
				<li class="twitter"><a target="_blank"
					href="http://www.twitter.com"><i class="fa fa-twitter"></i></a></li>
				<li class="googleplus"><a target="_blank"
					href="http://plus.google.com"><i class="fa fa-google-plus"></i></a></li>
			</ul>
		</form>
		</div>
		</div>
	</div>
</body>
</html>