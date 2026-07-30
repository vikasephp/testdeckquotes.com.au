<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

	<!-- Load jQuery -->
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript">
	google.load("jquery", "1");
</script>

<!-- Load TinyMCE -->
<script type="text/javascript" src="{{$BASE_URL}}js/tiny_mce/jquery.tinymce.js"></script>
<script type="text/javascript">
	$().ready(function() {
		$('textarea.tinymce').tinymce({
			// Location of TinyMCE script
			script_url : "{{$BASE_URL}}js/tiny_mce/tiny_mce.js",

			// General options
			theme : "advanced",
			plugins : "autolink,lists,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,advlist",

			// Theme options
			theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
			theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,image,cleanup,code,|,forecolor,backcolor",
			theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,iespell,media,|,ltr,rtl,|,fullscreen",
			//theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak",
			theme_advanced_toolbar_location : "top",
			theme_advanced_toolbar_align : "left",
			theme_advanced_statusbar_location : "bottom",
			theme_advanced_resizing : true,
			file_browser_callback : "ajaxfilemanager",
						// Example content CSS (should be your site CSS)
			content_css : "css/default/contactus-styles.css",

			// Drop lists for link/image/media/template dialogs
			template_external_list_url : "lists/template_list.js",
			external_link_list_url : "lists/link_list.js",
			external_image_list_url : "lists/image_list.js",
			media_external_list_url : "lists/media_list.js",
			 relative_urls : false,
       		 remove_script_host : false,


			// Replace values for the template plugin
			template_replace_values : {
				username : "Some User",
				staffid : "991234"
			}
		});
	});
	
function ajaxfilemanager(field_name, url, type, win) {
			var ajaxfilemanagerurl = "{{$BASE_URL}}js/tiny_mce/plugins/ajaxfilemanager/ajaxfilemanager.php";
			var view = 'detail';
			switch (type) {
				case "image":
				view = "thumbnail";
					break;
				case "media":
					break;
				case "flash": 
					break;
				case "file":
					break;
				default:
					return false;
			}
            tinyMCE.activeEditor.windowManager.open({
                url: "{{$BASE_URL}}js/tiny_mce/plugins/ajaxfilemanager/ajaxfilemanager.php?view=" + view,
                width: 850,
                height: 640,
                inline : "yes",
                close_previous : "no"
            },{
                window : win,
                input : field_name
            });
			            return false;			
			var fileBrowserWindow = new Array();
			fileBrowserWindow["file"] = ajaxfilemanagerurl;
			fileBrowserWindow["title"] = "Ajax File Manager";
			fileBrowserWindow["width"] = "850";
			fileBrowserWindow["height"] = "640";
			fileBrowserWindow["close_previous"] = "yes";
			tinyMCE.openWindow(fileBrowserWindow, {
			  window : win,
			  input : field_name,
			  resizable : "yes",
			  inline : "yes",
			  editor_id : tinyMCE.getWindowArg("tinymce")
			});
			
			return false;

			}
</script>
<!-- /TinyMCE -->  


<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div align="center" style="min-height:350px;">
    <h3 class="page-title">{{$title}}</h3>    
    {{if $opr}}
	<div align="center" style="min-height:350px; padding-top:200"><h3>Success...!</h3></div>
    {{else}}
<form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
<input type="hidden" name="email_library[eml_id]" value="{{$detail.$ID}}" id="eml_id"/>
    <table id="viewdoc-table" cellpadding="0" cellspacing="0" style="width:98% !important;">

        <tr>
            <th>Email Code:</th>
            <td><input type="text" name="email_library[eml_code]" value="{{$detail.eml_code}}" style="width:200px;"/></td>
            <th>Email Prupose:</th>
            <td><input type="text" name="email_library[eml_purpose]" value="{{$detail.eml_purpose}}" style="width:200px;"/></td>
        </tr>    
           
      
        

		<tr>
                <th>Email content:</th>
                <td width="650px" colspan="3">
                <table  width="650" id="none-table22"><tr><td>
                <textarea cols="60" id="editor1"  name="email_library[eml_email_content]" rows="20" class="tinymce">{{$detail.eml_email_content}}</textarea>    
                </td></tr></table>
                </td>
            </tr>
		<tr>
             <th>Link Uid:</th>
            <td><input type="text" name="email_library[eml_link_uid]" value="{{$detail.eml_link_uid}}" style="width:200px;"/></td>
            <th> Business Stream:</th>
            <td><input type="text" name="email_library[eml_business_stream]" value="{{$detail.eml_business_stream}}" style="width:200px;"/></td>


        </tr>
        
        	<tr>
            
                        <th>Internal or Ext. Email:</th>
            <td><select name="email_library[eml_ie_email]" class="lrg" style="width:220px;">
            	<option value="1" {{if $detail.eml_ie_email == 1}} selected="selected" {{/if}}>Internal</option>
				<option value="2" {{if $detail.eml_ie_email == 2}} selected="selected" {{/if}}>External</option>    	    
  			    </select>
            
            </td>
            
            <th>Attachments:</th>
            <td><input type="file" name="docs" /></td>

           
        </tr>
        
         	<tr>
             <th>DID:</th>
            <td><input type="text" name="email_library[eml_did]" value="{{$detail.eml_did}}" style="width:200px;"/></td>
            <th>Last Changed:</th>
            <td><input type="text" name="email_library[eml_last_change]" value="{{$detail.eml_last_change}}" style="width:200px;"/></td>

           
        </tr>
        
       	<tr>
         <th>Singnature:</th>
            <td><input type="text" name="email_library[eml_signarure_block]" value="{{$detail.eml_signarure_block}}" style="width:200px;"/></td>
            <th>Owner:</th>
            <td><input type="text" name="email_library[eml_owner]" value="{{$detail.eml_owner}}" style="width:200px;"/></td>
           
        </tr>
        

        <!--<tr><th colspan="2"><div id="doc_list" style="height:auto; padding-bottom:10px; min-height:40px;"></div></th></tr>-->

        <tr> 
        <td colspan="2" style="text-align:center;">
         <input type="submit" name="subAddDetail" value="Save" class="vsml" />
         <input type="button" name="btnCancelDetail" value="Cancel" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
        </td>
        </tr>
 		</table>

      </form>
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("{{$TABLE}}[sftype_id]","dontselect=0", "Please select type.");
			frmvalidator.addValidation("{{$TABLE}}[sf_title]","req", "Please specify title.");
			frmvalidator.addValidation("{{$TABLE}}[sf_body]","req", "Please specify formula.");
    </script>
   {{/if}} 
</div>
