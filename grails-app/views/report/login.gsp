<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Log in to OpenMarket</title>

</head>
<body onload=''>
	<section id="intro" class="home-section text-center">
		<div class="container">
			<div class="page-header">
				<h1>
					${subjectName} 게시판 로그인 하기
					<g:if test="${msg}">
						<br>
						<br>
						<small> ${msg}
						</small>
					</g:if>
				</h1>
			</div>
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<g:form action="login" method="POST">
						<fieldset class="form">
							<div class="form-group">
								<g:field type="email" class="form-control input-lg"
									placeholder="아이디를 입력하세요." name="userId" />
							</div>
							<div class="form-group">
								<g:passwordField class="form-control input-lg"
									placeholder="비밀번호를 입력하세요." name="userPw" />
							</div>
						</fieldset>
						<fieldset class="buttons">
							<div class="form-group">
								<g:submitButton name="login"
									class="btn btn-skin btn-lg btn-block" value="로그 인" />
							</div>
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>