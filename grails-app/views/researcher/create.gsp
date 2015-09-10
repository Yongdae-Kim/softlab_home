
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
	<section id="intro" class="home-section">
		<div class="container">
			<div class="page-header">
				<h1>
					연구원 등록하기 <br> <br> <small>소프트웨어 개발 연구실의 일원이 되신것을
						축하합니다.</small>
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
								<%-- #################### _form 템플릿 #################### --%>
								<g:render template="/researcher/form" />
								<%-- ###################################################### --%>
							</fieldset>
							<fieldset class="buttons">
								<div class="form-group">
									<g:submitButton name="create"
										class="btn btn-skin btn-two btn-lg btn-block" value="등 록 하 기" />
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

