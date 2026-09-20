  <script type="text/javascript" src="{{$BASE_URL}}js/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript">
	// Default skin
	tinyMCE.init({
		// General options
		mode : "exact",
		elements : "elm2",
		theme : "advanced",
		plugins : "autolink,lists,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,inlinepopups,autosave",

		// Theme options
		theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
		theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
		theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
		theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak,restoredraft",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "left",
		theme_advanced_statusbar_location : "bottom",
		theme_advanced_resizing : true,
		theme_advanced_fonts : "Andale Mono=andale mono,times;"+
                "Arial=arial,helvetica,sans-serif;"+
                "Arial Black=arial black,avant garde;"+
                "Book Antiqua=book antiqua,palatino;"+
				"Calibri=Calibri, Verdana, Helvetica, sans-serif;"+
                "Comic Sans MS=comic sans ms,sans-serif;"+
                "Courier New=courier new,courier;"+
                "Georgia=georgia,palatino;"+
                "Helvetica=helvetica;"+
                "Impact=impact,chicago;"+
                "Symbol=symbol;"+
                "Tahoma=tahoma,arial,helvetica,sans-serif;"+
                "Terminal=terminal,monaco;"+
                "Times New Roman=times new roman,times;"+
                "Trebuchet MS=trebuchet ms,geneva;"+
                "Verdana=verdana,geneva;"+
                "Webdings=webdings;"+
                "Wingdings=wingdings,zapf dingbats",

		// Example content CSS (should be your site CSS)
		content_css : "css/content.css",

		// Drop lists for link/image/media/template dialogs
		template_external_list_url : "lists/template_list.js",
		external_link_list_url : "lists/link_list.js",
		external_image_list_url : "lists/image_list.js",
		media_external_list_url : "lists/media_list.js",

		// Replace values for the template plugin
		template_replace_values : {
			username : "Some User",
			staffid : "991234"
		}
	});

	
  
    
</script>
{{if $close_win == 1}}    
<SCRIPT LANGUAGE="JavaScript">
<!--hide
window.close();
//-->
</SCRIPT>

 {{/if}}   
<div>
 <h3 class="page-title">{{$title}}</h3>
 <table cellpadding="0" cellspacing="0" width="100%" border="0" id="product-table">
 {{if $sent_mail}}<tr><td width="80%"><div align="center" style="color:#006600; font-size:15px;">{{$sent_mail}}</div></td></tr>{{/if}}
    <tr>
    <td width="100%" style="padding-left:70px;">
    <table width="80%" cellpadding="0" cellspacing="0">
    <tr><th width="20%"> Email Template:</th><td>
         <form name="template" action="{{$BASE_URL}}{{$XFA.taskemail}}" method="post" enctype="multipart/form-data">
        	<select name="temp_id">
            		<option value="0">no template</option>
                    {{foreach from=$email_template key='key' item='item'}}
                    	{{assign var="opgroup" value=$item.emt_name}}
                        {{if $opgroup !== $lastopgroup}}
                    <optgroup label="{{$opgroup}}" style="font-size:13px; color:#000000;"></optgroup>   
                    {{/if}} 
                    <option value="{{$item.et_id}}" {{if $temp_id == $item.et_id }} selected="selected" {{/if}}>&nbsp;&nbsp;{{$item.et_name}}</option>
                    
                    {{assign var="lastopgroup" value=$opgroup}}
                    
                    {{/foreach}}
            </select>
        <input type="submit" value="Load Template" name="load_temp"/>
        
        </td></tr>
        </form>
         <form name="send_email" action="{{$BASE_URL}}{{$XFA.taskemail}}" method="post">
        <tr><th>From: </th><td>
         
           <input type="hidden" name="send_email" value="send" />
            <input type="hidden" name="temp_id" value="{{$temp_id}}" id="temp_id" />
        <input type="text" name="from" style="width:300px;" value="{{$from}}" />
        </td></tr>
        <tr><th>To Name: </th><td><input type="text" name="to_name" style="width:300px;" value="{{$to_name}}" /></td></tr>
        <tr><th>To Email: </th><td><input type="text" name="to" style="width:300px;" value="{{$to}}" /></td></tr>
         <tr><th>Subject: </th><td><input type="text" name="subject" style="width:620px;" value="{{$subject}}" /></td></tr>
          <tr><th>Message: </th><td>
          <table id="none-table22"><tr><td>
          <textarea name="email_body"   id="elm2" style="width:500px;" rows="20">{{$body}}</textarea>
          </td></tr></table>
          </td></tr> 
           </form>  
           <form name="attachment_email" action="{{$BASE_URL}}{{$XFA.taskemail}}" method="post" enctype="multipart/form-data">       
           <tr><th>Attach: </th><td>
          
            <input type="hidden" name="temp_id" value="{{$temp_id}}" id="temp_id" />
              <input type="hidden" name="attachment" value="attach" />
           <input type="file" name="attachment"/>
           <span>{{if $attach_file}}{{$attach_file}}
           {{/if}}</span>
            &nbsp;&nbsp;&nbsp;
            {{if $attach_file}}
            	<input type="hidden" name="remove_attach" value="rt" />
                <input type="button" value="Remove" name="attachment_rm" onclick="document.location.href='{{$BASE_URL}}{{$XFA.taskemail}}/removeattachment/rm'" />
                 <input type="submit" value="Attach" name="attachment" />
           	{{else}} 
            <input type="submit" value="Attach" name="attachment" />
            {{/if}}
           </form></td></tr>
           <tr><td colspan="2"><input type="button" value="Send" onclick="document.send_email.submit();" />&nbsp; 
           <input type="button" value="Cancel" onclick="document.location.href='{{$XFA.email}}/opr/close'" /></td></tr>
        </table>
	</td>
  </tr>
</table>
</div>
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("send_email");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("email_body","req", "Please specify Body");
</script>