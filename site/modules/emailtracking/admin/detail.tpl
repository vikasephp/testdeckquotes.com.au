<script src="{{$BASE_URL}}/js/nicedit/nicEdit.js" type="text/javascript"></script>
<script type="text/javascript">
bkLib.onDomLoaded(function() {
	new nicEditor({iconsPath : '{{$BASE_URL}}/js/nicedit/nicEditorIcons.gif', maxHeight : 500}).panelInstance('area5');
});
</script> 
<div class="newdiv">
<h3 class="page-title">{{$title}}</h3>
<br />
<form name="template" method="post" action="{{$BASE_URL}}{{$XFA.detail}}" enctype="multipart/form-data">
	<input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
	<table id="product-table" align="center" width="98%">
  	<tr><th class="labelhead" width="10%">Section:</th><td>{{$detail.emt_name}}</td></tr>
    <tr><th class="labelhead" width="10%">Supports:</th><td>{{$detail.et_user_name}}</td></tr>
    <tr><th class="labelhead" width="10%">To:</th><td>{{$detail.et_to_name}} - {{$detail.et_to_email}}</td></tr>
    <tr><th class="labelhead" width="10%">From:</th><td>{{$detail.et_from_name}} - {{$detail.et_from_email}}</td></tr>
    <tr><th class="labelhead" width="10%">Subject:</th><td>{{$detail.et_subject}}</td></tr>
    <tr><th class="labelhead" width="10%" valign="top">Body:</th><td>
   <div style="padding:10px;"> {{$detail.et_body|strip}}</div>
    </td></tr>
     <tr><th class="labelhead" width="10%">Date:</th><td>{{$detail.et_date}}</td></tr>  
      <tr><th class="labelhead" width="10%">Ip:</th><td>{{$detail.et_ip}}</td></tr>                              
	 <tr><th class="labelhead" width="10%">Attachment:</th><td>
     	{{if $attachments}}
        	<ul>
     		{{foreach from=$attachments key="key" item="item"}}
            <li><a href="{{$item}}" target="_blank" title="View"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}/images/attachment.png"/></a></li>
            {{/foreach}}
     		</ul>
       {{/if}}</td></tr> 
<tr>
			<td colspan="2" style="text-align:center">
				&nbsp;
				<input class="addButtons" type="button" value="Cancel" onclick="document.location.href='{{$BASE_URL}}{{$XFA.list}}';">
			</td>
		</tr>

    </table>
</form>
</div>
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("template");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("{{$TABLE}}[et_name]",   "req", "Please specify Template Name.");
	frmvalidator.addValidation("{{$TABLE}}[et_subject]","req", "Please specify Template Subject.");
	frmvalidator.addValidation("{{$TABLE}}[et_body]",   "req", "Please specify Template Body.");
	
</script>
