<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
 {{if $close_win == 1}}    
<SCRIPT LANGUAGE="JavaScript">
setTimeout("parent.$.fancybox.close();", 4000);
</SCRIPT>

 {{/if}}   
<div>
 <h3 class="page-title">{{$title}}</h3>
 <table cellpadding="0" cellspacing="0" width="100%" border="0" id="product-table">
 {{if $sent_mail}}<tr><td width="80%"><div align="center" style="color:#006600; font-size:15px;">{{$sent_mail}}</div></td></tr>
 <tr><td width="80%"><div align="center" style="color:#006600; font-size:15px;"><input type="button" value="Cancel" onclick="parent.$.fancybox.close();" name="cancel" /></div></td></tr>
 
 {{/if}}
  {{if $close_win == 0}}
  <tr><td width="100%" align="center"><div align="center" style="color: #333333; height:40px; font-size:15px;">Are you sure want to send email to customer?</div></td></tr> 
    <tr>
    <td width="100%">
    <div align="center">
    <table width="100%" cellpadding="0" cellspacing="0">
           <tr><td colspan="2">
           <div align="center">
           <form name="taskemail" action="" method="post">
           <input type="hidden" name="bt_id" value="{{$bt_id}}" />
            <input type="hidden" name="bid" value="{{$bid}}" />
           <input type="submit" value="Send"  name="send_email" />&nbsp; 
           <input type="button" value="Cancel" onclick="parent.$.fancybox.close();" name="cancel" /></form>
           </div>
           </td></tr>
        </table>
	</div>
    </td>
  </tr>
  {{/if}}
</table>
</div>
