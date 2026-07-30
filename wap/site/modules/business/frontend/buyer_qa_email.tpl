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
 


<body style="background-color: #D7D7D7;">   
<div align="center" style="padding-top:10px;">
 <h3 class="page-title">{{$title}}</h3>
 {{if $report_msg}}
 	<div class="email_sent">{{$report_msg}} message(s) has been sent successfully.
    <br>
    <p style="padding-top:20px; bottom:0;"><br><br><br><input type="button" value="Close" onClick="window.close();" /></p>
    
    </div>	
    
 {{elseif $sent_mail}}   
  	<div class="email_sent">Message(s) has been sent successfully.
    <br>
    <p style="padding-top:20px; bottom:0;"><br><br><br><input type="button" value="Close" onClick="window.close();" /></p> 
    </div>	
	{{else}}
 
 <table cellpadding="0" cellspacing="0" width="100%" border="0" id="buyer_email_table">
 <form name="send_email" action="" method="post">
 <input type="hidden" name="bsn_id" value="{{$bsn_id}}">
 
         <tr><th>Customers: </th><td>
         			
         		 {{foreach from=$buyers key="key" item="item"}}
                <input type="checkbox" checked="checked" name="buyer_name[]" value="{{$item.be_customer_id}}" /> {{$item.bcust_fname}} {{$item.bcust_lname}}<br />
                
                  {{/foreach}}
              
        </td></tr>
       
         <tr><th>Subject: </th><td><input type="text" name="subject" style="width:620px;" value="{{$subject}}" /></td></tr>
          <tr><th>Variables: </th><td>
          		<table><tr>
          {{counter assign="count"}}
            			{{foreach from=$email_temp_vars_buyers item="item" key="key"}}
                     
            			<td width="33%"><b>{{$key}}</b> => <input type="text" readonly value="{{$item}}" /></td>
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
   
           
          <tr><th>&nbsp;Attachment: </th><td>{{$attach_file}}</td>
            </tr> 

           <tr><td colspan="2"><div align="center"><input type="submit" value="Send" name="send_email" />&nbsp; 
           <input type="button" value="Close" onClick="window.close();" /></div></td></tr>
         </form> 
</table>

<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("send_email");
    frmvalidator.EnableMsgsTogether();
	{{if $buyers_count > 1}}
    frmvalidator.addValidation("buyer_name[]","selone_radio", "Please check at least one buyer.");
	{{else}}
	frmvalidator.addValidation("buyer_name[]","shouldselchk=on", "Please check buyer.");
	{{/if}}
	
   <!-- frmvalidator.addValidation("email_body","req", "Please specify body.");-->
	frmvalidator.addValidation("subject","req", "Please specify subject.");
	
</script>
{{/if}}
</div>
</body>