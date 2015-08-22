<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header page-scroll">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-main-collapse">
				<i class="fa fa-bars"></i>
			</button>
			<a class="navbar-brand" href="${createLink(uri: '/')}">
				<h1>소프트웨어 개발 연구실</h1>
			</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div
			class="collapse navbar-collapse navbar-right navbar-main-collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a href="${createLink(uri: '/')}">홈</a></li>
				<li><a href="${createLink(uri: '/#service')}">소 개</a></li>
				<li><a href="${createLink(uri: '/#professor')}">담당교수</a></li>
				<li><a href="${createLink(uri: '/#written')}">집필도서</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">레포트 게시판<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><g:link controller="javaReport" action="index">
										JAVA</g:link></li>
						<li><g:link controller="csharpReport" action="index">
										C#</g:link></li>
						<li><g:link controller="androidReport" action="index">
										Android</g:link></li>
						<li><g:link controller="dataStrReport" action="index">
										자료구조</g:link></li>
						<li><g:link controller="softEngReport" action="index">
										소프트웨어공학</g:link></li>
					</ul></li>
				<li><g:link controller="board" action="index">
										자유게시판</g:link></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container -->
</nav>