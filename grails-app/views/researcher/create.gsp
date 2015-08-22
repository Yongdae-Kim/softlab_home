
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />

<title>Register Product to OpenMarket</title>

<script type="text/javascript">
	j$(document).ready(function() {
		var opt = {
			img : j$('#img_preview'),
			w : 420,
			h : 460
		};
		j$('#input_file').setPreview(opt);
	});
	
</script>
</head>
<body onload=''>
	<section id="create">
		<div class="container">
			<div class="page-header">
				<h1>
					연구원 등록하기 <br> <small>After completing the form, Click
						the 'Register' button</small>
				</h1>
			</div>
			<div class="row">
				<div class="col-md-10 col-md-offset-1">

					<div class="col-md-6">
						<img id="img_preview" style="display: none;" class="img-thumbnail"
							alt="Cinque Terre">
					</div>
					<div class="col-md-6">
						<g:uploadForm action="save" method="POST">
							<fieldset class="form">
								<div class="well well-sm">
									<strong><span class="glyphicon glyphicon-asterisk"></span>
										필 수 입 력</strong>
								</div>
								<div class="form-group">
									<label>이 름</label>
									<div class="input-group">
										<g:textField name="name" class="form-control"
											value="${fieldValue(bean: researcherInstance, field: 'name')}"
											required="required" placeholder="이름을 입력하세요." />
										<span class="input-group-addon"><span
											class="glyphicon glyphicon-asterisk"></span></span>
									</div>
								</div>
								<div class="form-group">
									<label>입학년도</label>
									<div class="input-group">
										<g:field type="number" name="admissionNum"
											class="form-control"
											value="${fieldValue(bean: researcherInstance, field: 'admissionNum')}"
											placeholder="입학년도를 입력하세요." />
										<span class="input-group-addon"></span>
									</div>
								</div>
								<div class="form-group">
									<label>연 락 처</label>
									<div class="input-group">
										<g:field type="tel" name="phoneNum" class="form-control"
											value="${fieldValue(bean: researcherInstance, field: 'phoneNum')}"
											placeholder="연락처를 입력하세요." />
										<span class="input-group-addon"><span
											class="glyphicon glyphicon-asterisk"></span></span>
									</div>
								</div>
								<div class="form-group">
									<label>이 메 일</label>
									<div class="input-group">
										<g:field type="email" name="email" class="form-control"
											value="${fieldValue(bean: researcherInstance, field: 'email')}"
											placeholder="이메일을 입력하세요." />
										<span class="input-group-addon"><span
											class="glyphicon glyphicon-asterisk"></span></span>
									</div>
								</div>
								<div class="form-group">
									<label>사진 등록</label>
									<div class="input-group">
										<input type="file" id="input_file" multiple accept='image/*'
											name="upload_file" class="form-control" /> <span
											class="input-group-addon"></span>
									</div>
								</div>
							</fieldset>
							<fieldset class="buttons">
								<div class="form-group">
									<g:submitButton name="create"
										class="btn btn-custom btn-two btn-lg btn-block"
										value="등 록 하 기" />
								</div>
							</fieldset>
						</g:uploadForm>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>

