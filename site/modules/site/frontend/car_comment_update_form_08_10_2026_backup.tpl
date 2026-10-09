<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">


<script src="{{$BASE_URL}}ckeditor2/ckeditor.js"></script>
<script src="{{$BASE_URL}}ckeditor2/samples/js/sample.js"></script>
<link rel="stylesheet" href="{{$BASE_URL}}ckeditor2/samples/css/samples.css">
<link rel="stylesheet" href="{{$BASE_URL}}ckeditor2/samples/toolbarconfigurator/lib/codemirror/neo.css">

{{if $opr}}
<script type="text/javascript">
	setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<style>
	input[type="submit"] {
		background: #06C !important;
		font-size: 18px;
	}
	.car-phone .gcons-document-outline {
		display: none !important;
	}
	.car-phone .gcons-ck-with-outline {
		display: block !important;
	}
	.car-phone .gcons-ck-editor-col,
	.car-phone .ck.ck-editor {
		width: 100% !important;
		max-width: 100% !important;
	}
	.car-phone .ck.ck-editor__top,
	.car-phone .ck.ck-toolbar {
		display: flex !important;
		flex-wrap: wrap;
	}
</style>

<div align="center" style="min-height:350px;">
	<h3 class="page-title">CAR Update Form</h3>


	<form name="detail" method="post" action="" enctype="multipart/form-data">
		<table id="list-table" width="100%">
			<input type="hidden" name="contact['cs_id']" value="{{$detail.cs_id}}" />
			{{if $opr}}
			<tr>
				<th colspan="2" style="color:#0C6; font-size:14px;">Comment has been added successfully</th>
			</tr>{{/if}}
			{{if $form_error}}
			<tr>
				<th colspan="2" style="color:#FF0000; font-size:14px;">{{$form_error}}</th>
			</tr>{{/if}}

			<tr>
				<th>Record No</th>
				<td><input type="text" name="car[car_id]" style="width:700px" value="{{$detail.car_id}}"
						readonly="readonly" />
				</td>
			</tr>

			<tr>
				<th>Project</th>
				<td><input type="text" value="{{$detail.car_project}}" style="width:700px;" readonly="readonly" /> </td>
			</tr>


			<tr>
				<th>Date</th>
				<td><input type="text" value="{{$detail.car_date}}" style="width:700px;" readonly="readonly" /> </td>
			</tr>

			<tr>
				<th>Alert</th>
				<td><input type="text" value="{{$detail.car_alert}}" style="width:700px;" readonly="readonly" /> </td>
			</tr>

			<tr>
				<th>Photos</th>
				<td>
					{{if $detail.car_image1}}
					<div>
						Photo 1 : 
                        <a href="/site.download_content_car?file_name={{$detail.car_image1}}&module_name=site.car_comment_update_form">Download</a>
					</div>
					{{/if}}



					{{if $detail.car_image2}}
					<div>
						Photo 2 : 
						<a href="/site.download_content_car?file_name={{$detail.car_image2}}&module_name=site.car_comment_update_form">Download</a>
					</div>
					{{/if}}

					{{if $detail.car_image3}}
					<div>
						Photo 3 : <a href="/site.download_content_car?file_name={{$detail.car_image3}}&module_name=site.car_comment_update_form">Download</a>
					</div>
					{{/if}}

					{{if $detail.car_image4}}
					<div>
						Photo 4 : <a href="/site.download_content_car?file_name={{$detail.car_image4}}&module_name=site.car_comment_update_form">Download</a>
					</div>
					{{/if}}

					{{if $detail.car_image5}}
					<div>
						Photo 5 : <a href="/site.download_content_car?file_name={{$detail.car_image5}}&module_name=site.car_comment_update_form">Download</a>
					</div>
					{{/if}}
				</td>
			</tr>

			<tr>
				<th>Select which supplier you are</th>
				<td><select name="car[car_which_suplier]">
						<option value="">Please Select</option>
						{{foreach from=$contactdetail key="key" item="item"}}
						<option value="{{$item.se_supplier}} - {{$item.se_first_name}} {{$item.se_surname}}">
							{{$item.se_supplier}} - {{$item.se_first_name}} {{$item.se_surname}}</option>
						{{/foreach}}
					</select></td>
			</tr>

			<tr>
				<th>Attachment Upload</th>
				<td><input type="file" name="attach" /> 
                <input type="file" name="attach_2" /> 
                <input type="file" name="attach_3" /> 
                <input type="file" name="attach_4" /> 
                <input type="file" name="attach_5" /> 
                </td>
			</tr>

			<tr>
				<th>Commernt From Supplier</th>
				<td>
					<textarea name="car[car_comment]" rows="10" id="editor" cols="100"></textarea>
				</td>
			</tr>

			<tr>
				<th>Alert Resolved</th>
				<td>
					<label style="display:inline-block; padding:12px 18px; font-size:18px;">
						<input type="radio" name="car[cu_alert_resolved]" value="1" /> Yes
					</label>
					<label style="display:inline-block; padding:12px 18px; font-size:18px;">
						<input type="radio" name="car[cu_alert_resolved]" value="0" /> No
					</label>
				</td>
			</tr>

			<tr>
				<td colspan="2" style="text-align:center;">
					<input type="submit" name="subAddDetail" value="Submit  the  Update  Form" />

				</td>
			</tr>
		</table>
	</form>

	<script type="text/javascript">
		function closepop() {
			setTimeout('parent.close_win();', 500);
		}
	</script>

	<script type="text/javascript" language="javascript">
		var frmvalidator = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		//frmvalidator.addValidation("car[car_comment]","minlen=10", "Please specify comment (Minimum 15 Character required).");
		//frmvalidator.addValidation("car[car_which_suplier]", "req", "Please specify supplier name.");
		//frmvalidator.addValidation("car[cu_alert_resolved]", "selone_radio", "Please select Alert Resolved.");
		//frmvalidator.addValidation("contact[cl_contact_name]","req", "Please specify contact name.");
	</script>
	
	<!--<script>
	document.forms.detail.addEventListener('submit', function (e) {

		var errors = [];

		// Check supplier
		var supplier = document.forms.detail.elements['car[car_which_suplier]'];

		if (!supplier || !supplier.value) {
			errors.push('Please specify supplier name.');
		}


		// Check Alert Resolved
		var alertResolved = document.forms.detail.elements['car[cu_alert_resolved]'];
		var alertResolvedSelected = false;

		if (alertResolved) {
			for (var i = 0; i < alertResolved.length; i++) {
				if (alertResolved[i].checked) {
					alertResolvedSelected = true;
					break;
				}
			}
		}

		if (!alertResolvedSelected) {
			errors.push('Please select Alert Resolved.');
		}


		// Check CKEditor comment
		var editor = window.GCONS_CKEditor5 &&
					 window.GCONS_CKEditor5.editors &&
					 window.GCONS_CKEditor5.editors.editor;

		var comment = '';

		if (editor && typeof editor.getData === 'function') {
			comment = editor.getData();
		}

		var text = comment
			.replace(/<[^>]*>/g, '')
			.replace(/&nbsp;/gi, ' ')
			.replace(/\s+/g, ' ')
			.trim();

		if (!text) {
			errors.push('Please specify comment.');
		}


		// Show ONE alert containing all errors
		if (errors.length > 0) {
			e.preventDefault();

			alert(errors.join('\n'));

			return false;
		}

	});
	</script>-->


</div>

<script>
function validateCarForm() {

    var errors = [];

    // Supplier
    var supplier = document.forms.detail.elements['car[car_which_suplier]'];

    if (!supplier || !supplier.value) {
        errors.push('Please specify supplier name.');
    }

    // Alert Resolved
    var alertResolved = document.forms.detail.elements['car[cu_alert_resolved]'];
    var alertResolvedSelected = false;

    if (alertResolved) {
        for (var i = 0; i < alertResolved.length; i++) {
            if (alertResolved[i].checked) {
                alertResolvedSelected = true;
                break;
            }
        }
    }

    if (!alertResolvedSelected) {
        errors.push('Please select Alert Resolved.');
    }

        // Comment validation
    var comment = '';

    // Desktop: CKEditor
    var editor = window.GCONS_CKEditor5 &&
                 window.GCONS_CKEditor5.editors &&
                 window.GCONS_CKEditor5.editors.editor;

    if (editor && typeof editor.getData === 'function') {
        try {
            comment = editor.getData() || '';
        } catch (err) {}
    }

    // Mobile: normal textarea
    if (!comment) {
        var textarea = document.getElementById('editor');

        if (textarea) {
            comment = textarea.value || '';
        }
    }

    // Remove HTML and whitespace
    var text = String(comment)
        .replace(/<[^>]*>/g, ' ')
        .replace(/&nbsp;|\u00a0/gi, ' ')
        .replace(/\s+/g, ' ')
        .trim();

    if (!text) {
        errors.push('Please specify comment.');
    }


    // One alert only
    if (errors.length > 0) {
        alert(errors.join('\n'));
        return false;
    }

    return true;
}
</script>


<script>
	var phoneComment = /iPhone|iPad|iPod|Android|Mobile/i.test(navigator.userAgent || '');
	if (!phoneComment && navigator.maxTouchPoints > 1 && window.matchMedia && window.matchMedia('(max-width: 1024px)').matches) {
		phoneComment = true;
	}
	if (phoneComment && document.documentElement) {
		document.documentElement.className += ' car-phone';
	}
	initSample();

	var savedComment = '';

	function commentText(html) {
		return String(html || '').replace(/<[^>]+>/g, ' ').replace(/&nbsp;|\u00a0/gi, ' ').replace(/\s+/g, ' ').trim();
	}

	function readEditorComment() {
		var nodes = document.querySelectorAll('.ck-editor__editable, .ck-source-editing-area textarea');
		var best = '';
		var bestLen = 0;
		var i;
		var node;
		var text;
		var html;
		var placeholder;
		for (i = 0; i < nodes.length; i++) {
			node = nodes[i];
			if (node.closest && node.closest('.ck-toolbar')) {
				continue;
			}
			text = String(node.textContent || node.value || '').replace(/\u00a0/g, ' ').replace(/\s+/g, ' ').trim();
			placeholder = String(node.getAttribute('data-placeholder') || '').replace(/\s+/g, ' ').trim();
			if (!text || text === placeholder || text.length <= bestLen) {
				continue;
			}
			bestLen = text.length;
			html = node.tagName === 'TEXTAREA' ? node.value : node.innerHTML;
			best = html || '';
		}
		var editor = window.GCONS_CKEditor5 && window.GCONS_CKEditor5.editors && window.GCONS_CKEditor5.editors.editor;
		if (editor && typeof editor.getData === 'function') {
			try {
				html = editor.getData() || '';
				if (commentText(html).length > commentText(best).length) {
					best = html;
				}
			} catch (err) {}
		}
		if (commentText(best)) {
			savedComment = best;
		}
		return savedComment;
	}

	function watchEditor() {
		var editor = window.GCONS_CKEditor5 && window.GCONS_CKEditor5.editors && window.GCONS_CKEditor5.editors.editor;
		var nodes = document.querySelectorAll('.ck-editor__editable');
		var i;
		for (i = 0; i < nodes.length; i++) {
			if (nodes[i]._carWatch) {
				continue;
			}
			nodes[i]._carWatch = true;
			nodes[i].addEventListener('input', readEditorComment, true);
			if (window.MutationObserver) {
				new MutationObserver(readEditorComment).observe(nodes[i], {
					subtree: true,
					childList: true,
					characterData: true
				});
			}
		}
		if (editor && !editor._carWatch && typeof editor.updateSourceElement === 'function') {
			editor._carWatch = true;
			editor.updateSourceElement = function () {
				var html = readEditorComment();
				var textarea = document.getElementById('editor');
				if (textarea && commentText(html)) {
					textarea.value = html;
				}
			};
		}
	}

	setInterval(watchEditor, 500);
	document.addEventListener('input', readEditorComment, true);
	document.addEventListener('keyup', readEditorComment, true);
	document.addEventListener('compositionend', readEditorComment, true);
	document.addEventListener('focusout', readEditorComment, true);
	setInterval(readEditorComment, 400);

	var carForm = document.forms.detail;

	if (carForm && phoneComment) {
		var carButton = carForm.querySelector('[name="subAddDetail"]');
		if (carButton) {
			carButton.addEventListener('touchstart', readEditorComment, true);
			carButton.addEventListener('pointerdown', readEditorComment, true);
		}
		carForm.addEventListener('submit', function (event) {
			event.preventDefault();
			event.stopPropagation();
			if (carForm.getAttribute('data-car-posting') === '1') {
				return;
			}
			readEditorComment();
			
			if (!validateCarForm()) {
				return;
			}
			
			try {
				if (typeof carForm.onsubmit === 'function' && carForm.onsubmit() === false) {
					return;
				}
			} catch (errValidate) {}
			var typedBox = document.getElementById('editor');
			var typedValue = typedBox ? typedBox.value : '';
			var comment = savedComment || '';
			if (commentText(typedValue).length > commentText(comment).length) {
				comment = typedValue;
			}
			var data = new FormData();
			var fields = carForm.elements;
			var index;
			var field;
			carForm.setAttribute('data-car-posting', '1');
			for (index = 0; index < fields.length; index++) {
				field = fields[index];
				if (!field.name || field.disabled || field.type === 'submit' || field.type === 'button') {
					continue;
				}
				if (field.type === 'file') {
					if (field.files && field.files[0]) {
						data.append(field.name, field.files[0], field.files[0].name);
					}
					continue;
				}
				if ((field.type === 'radio' || field.type === 'checkbox') && !field.checked) {
					continue;
				}
				data.append(field.name, field.value);
			}
			data.set('car[car_comment]', comment);
			data.set('subAddDetail', 'Submit  the  Update  Form');
			var xhr = new XMLHttpRequest();
			xhr.open('POST', carForm.action || window.location.href, true);
			xhr.onload = function () {
				carForm.removeAttribute('data-car-posting');
				if (xhr.status >= 200 && xhr.status < 400 && xhr.responseText) {
					document.open();
					document.write(xhr.responseText);
					document.close();
					return;
				}
				alert('Could not save the update. Please try again.');
			};
			xhr.onerror = function () {
				carForm.removeAttribute('data-car-posting');
				alert('Could not save the update. Please try again.');
			};
			xhr.send(data);
		}, true);
	}
</script>

<script>
var carForm = document.forms.detail;

if (carForm && !phoneComment) {
    carForm.addEventListener('submit', function (event) {

        if (!validateCarForm()) {
            event.preventDefault();
            return false;
        }

    });
}
</script>