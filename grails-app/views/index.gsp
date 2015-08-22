<%@ page import="com.jejuuniv.softlab.home.Subject"%>
<!DOCTYPE html>
<html>
<head>

<title>Squadfree - Free bootstrap 3 one page template</title>

<meta name="layout" content="main" />

</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-custom">
	<!-- ######################################## Preloader ######################################## -->
	<div id="preloader">
		<div id="load"></div>
	</div>

	<!-- ######################################## Section: intro ######################################## -->
	<section id="intro" class="intro">

		<div class="slogan">
			<h2>
				WELCOME TO <span class="text_color">SOFT LAB</span>
			</h2>
			<br>
			<h4>
				저희 연구실은 프로그래밍의 기본이되는 알고리즘을 이해하고,<br> 소프트웨어의 분석, 설계, 개발 방법론을
				연구합니다.<br>또한, 소프트웨어의 유지보수 및 관리를 용이하게 수행할 수 있는 방법을 연구합니다.
			</h4>
		</div>
		<div class="page-scroll">
			<a href="#service" class="btn btn-circle"> <i
				class="fa fa-angle-double-down animated"></i>
			</a>
		</div>
	</section>
	<!-- ######################################## /Section: intro ######################################## -->


	<!-- ######################################## Section: services ######################################## -->
	<section id="service" class="home-section text-center bg-gray">

		<div class="heading-about">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2">
						<div class="wow bounceInDown" data-wow-delay="0.4s">
							<div class="section-heading">
								<h2>Our Services</h2>
								<i class="fa fa-2x fa-angle-down"></i>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-2 col-lg-offset-5">
					<hr class="marginbot-50">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-3 col-md-3">
					<div class="wow fadeInLeft" data-wow-delay="0.2s">
						<div class="service-box">
							<div class="service-icon">
								<img src="images/icons/service-icon-1.png" alt="" />
							</div>
							<div class="service-desc">
								<h5>Print</h5>
								<p>Vestibulum tincidunt enim in pharetra malesuada. Duis
									semper magna metus electram accommodare.</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-3 col-md-3">
					<div class="wow fadeInUp" data-wow-delay="0.2s">
						<div class="service-box">
							<div class="service-icon">
								<img src="images/icons/service-icon-2.png" alt="" />
							</div>
							<div class="service-desc">
								<h5>Web Design</h5>
								<p>Vestibulum tincidunt enim in pharetra malesuada. Duis
									semper magna metus electram accommodare.</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-3 col-md-3">
					<div class="wow fadeInUp" data-wow-delay="0.2s">
						<div class="service-box">
							<div class="service-icon">
								<img src="images/icons/service-icon-3.png" alt="" />
							</div>
							<div class="service-desc">
								<h5>Photography</h5>
								<p>Vestibulum tincidunt enim in pharetra malesuada. Duis
									semper magna metus electram accommodare.</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-3 col-md-3">
					<div class="wow fadeInRight" data-wow-delay="0.2s">
						<div class="service-box">
							<div class="service-icon">
								<img src="images/icons/service-icon-4.png" alt="" />
							</div>
							<div class="service-desc">
								<h5>Cloud System</h5>
								<p>Vestibulum tincidunt enim in pharetra malesuada. Duis
									semper magna metus electram accommodare.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ######################################## /Section: services ######################################## -->

	<!-- ######################################## Section: professor ######################################## -->
	<section id="professor" class="home-section text-center">
		<div class="heading-contact">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2">
						<div class="wow bounceInDown" data-wow-delay="0.4s">
							<div class="section-heading">
								<h2>교 수 님 소 개</h2>
								<i class="fa fa-2x fa-angle-down"></i>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">

			<div class="row">
				<div class="col-lg-2 col-lg-offset-5">
					<hr class="marginbot-50">
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="boxed-grey">
						<div class="row">
							<div class="col-md-3">
								<div class="form-group">
									<img src="images/professor/professor.jpg" alt=""
										class="img-responsive img-circle" />
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title">이 름</h3>
									</div>
									<div class="panel-body">변 상용</div>
									<div class="panel-heading">
										<h3 class="panel-title">이 메 일</h3>
									</div>
									<div class="panel-body">
										<span class="input-group-addon"><span
											class="glyphicon glyphicon-envelope"></span><a
											href="mailto:byunsy@cheju.ac.kr"><em>
													byunsy@cheju.ac.kr</em></a></span>
									</div>
									<div class="panel-heading">
										<h3 class="panel-title">담 당 과 목</h3>
									</div>
									<div class="panel-body">
										<g:select name="subject" class="form-control"
											from="${Subject.values()}" keys="${Subject.values()*.name()}"
											optionValue="value" />
									</div>
								</div>
							</div>
							<div class="col-md-9">
								<br>
								<h2>연 혁</h2>
								<br>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title">학 위</h3>
									</div>
									<div class="panel-body">
										중앙대학교 경제학과<br> 중앙대학교(이학석사)<br>중앙대학교(공학박사)
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title">경 력</h3>
									</div>
									<div class="panel-body">
										본교 전임교원 최초 임용일 : 1991. 3. 11<br>코오롱상사(주) 기획실 기획주임
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title">논 문</h3>
									</div>
									<div class="panel-body">
										1. 변상용, "Reliable Information Search Mechanism through the
										Cooperation of Multiagent Systems in the Distributied
										Environment", ACIS, SERA 2004, pp.184-188, 2004.5.6.<br>
										<br> 2. 변상용, "Association Rule Discovery in Data Mining
										Using Principal Component Analysis", 한국 simuilation 학회, AIS
										2004 conference, 2004.10.4.
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ######################################## /Section: professor ######################################## -->

	<!-- ######################################## Section: written ########################################-->
	<section id="written" class="home-section text-center">
		<div class="heading-about">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2">
						<div class="wow bounceInDown" data-wow-delay="0.4s">
							<div class="section-heading">
								<h2>집 필 도 서</h2>
								<i class="fa fa-2x fa-angle-down"></i>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">

			<div class="row">
				<div class="col-lg-2 col-lg-offset-5">
					<hr class="marginbot-50">
				</div>
			</div>
			<div class="row">
				<div class="col-xs-6 col-sm-3 col-md-3">
					<div class="wow bounceInUp" data-wow-delay="0.2s">
						<div class="team boxed-grey">
							<div class="inner">
								<h5>쉽게 배우는 자료구조</h5>
								<p class="subtitle">Pixel Crafter</p>
								<div class="avatar">
									<img src="images/books/book_data_str.jpg" alt=""
										class="img-responsive img-rounded" />
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-6 col-sm-3 col-md-3">
					<div class="wow bounceInUp" data-wow-delay="0.5s">
						<div class="team boxed-grey">
							<div class="inner">
								<h5>
									자바와 UML 을 이용한<br>객체지향 프로그래밍 정석
								</h5>
								<p class="subtitle">Ruby on Rails</p>
								<div class="avatar">
									<img src="images/books/book_oop.jpg" alt=""
										class="img-responsive img-rounded" />
								</div>

							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-6 col-sm-3 col-md-3">
					<div class="wow bounceInUp" data-wow-delay="0.8s">
						<div class="team boxed-grey">
							<div class="inner">
								<h5>
									객체 지향 모델링 및<br> UML 디자인
								</h5>
								<p class="subtitle">jQuery Ninja</p>
								<div class="avatar">
									<img src="images/books/book_oom_ud.jpg" alt=""
										class="img-responsive img-rounded" />
								</div>

							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-6 col-sm-3 col-md-3">
					<div class="wow bounceInUp" data-wow-delay="1s">
						<div class="team boxed-grey">
							<div class="inner">
								<h5>소프트웨어공학</h5>
								<p class="subtitle">Typographer</p>
								<div class="avatar">
									<img src="images/books/book_soft_eng.jpg" alt=""
										class="img-responsive img-rounded" />
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ######################################## /Section: written ######################################## -->
</body>

</html>
