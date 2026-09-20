<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
	<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>

<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
{{if $close_win == 1}}    
<script type="text/javascript">
<!--hide
window.close();
//-->
</script>
 {{/if}}
 


<body>   
<div align="center" style="background-color: #D7D7D7;">
 <h3 class="page-title">{{$title}}</h3>
 <table cellpadding="0" cellspacing="0" width="100%" border="0" id="buyer_email_table">
 <form name="send_email" action="" method="post">
 {{if $sent_mail}}<tr><td width="80%" colspan="2"><div align="center" style="color:#006600; font-size:15px;">{{$sent_mail}}</div></td></tr>{{/if}}

         <tr><th>Sellers: </th><td>
         			
         		 {{foreach from=$sellers key="key" item="item"}}
                <input type="checkbox" checked="checked" name="seller_name[]" value="{{$item.bs_customers_id}}" /> {{$item.bcust_fname}} {{$item.bcust_lname}}<br />
                
                  {{/foreach}}
              
        </td></tr>
       
         <tr><th>Subject: </th><td><input type="text" name="subject" style="width:620px;" value="{{$subject}}" /></td></tr>
          <tr><th>Variables: </th><td>
          		<table><tr>
          {{counter assign="count"}}
            			{{foreach from=$email_temp_vars_seller item="item" key="key"}}
                     
            			<td width="33%"><b>{{$key}}</b> => <input type="text" readonly="readonly" value="{{$item}}" /></td>
                        {{if $count % 2 == 0}}                      
                        </tr>
                        <tr>
                        {{/if}}
            		{{counter  assign="count"}}
           				 {{/foreach}}
                     </table>    
                         
          </td></tr>
          
          <tr><th>Message: </th><td>
          <table id="none-table22"><tr><td>{{fckeditor InstanceName="email_body" Value=$body Width="650px" Height="500px"}}        
          </td></tr></table>
          </td></tr> 
   
           
          <tr><th>Attachment: </th><td>{{$attach_file}}</td>
            </tr> 

           <tr><td colspan="2"><div align="center"><input type="submit" value="Send" name="send_email" />&nbsp; 
           <input type="button" value="Close" onClick="window.close();" /></div></td></tr>
         </form> 
</table>
</div>
</body>
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("send_email");
    frmvalidator.EnableMsgsTogether();
	{{if $seller_count > 1}}
    frmvalidator.addValidation("seller_name[]","selone_radio", "Please check at least one seller.");
	{{else}}
	frmvalidator.addValidation("seller_name[]","shouldselchk=on", "Please check seller.");
	{{/if}}
	
    frmvalidator.addValidation("email_body","req", "Please specify body.");
	frmvalidator.addValidation("subject","req", "Please specify title.");
	
</script>