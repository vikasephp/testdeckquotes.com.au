<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
  <script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<!--<script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/ckeditor.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/samples/js/sample.js"></script>-->
<!--<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>-->

	<script src="{{$BASE_URL}}ckeditor2/ckeditor.js"></script>
	<script src="{{$BASE_URL}}ckeditor2/samples/js/sample.js"></script>

	<script type="text/javascript">
           CKEDITOR.replace( 'editor1' );
           CKEDITOR.add  
        </script>
        
        <script type="text/javascript">
           CKEDITOR.replace( 'editor2' );
           CKEDITOR.add  
        </script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px;">
    <h3 class="page-title">{{$title}}</h3>    
   
   
<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   <tr>
     <th> Customer Name </th>
     <td> 
     <datalist id='project' >
       {{foreach from=$projdetail2 key="key3" item="item3"}}
        <option value="{{$item3.bcust_fname}} {{$item3.bcust_lname}} | {{$item3.bsn_name}} | {{$item3.bsn_sub_status}}" {{if $bsnid eq $item3.bsn_id}} selected="selected" {{/if}} >
        {{$item3.bcust_fname}} {{$item3.bcust_lname}}
        </option>
        {{/foreach}}
    </datalist>
  
    <input  type="text" name="{{$TABLE}}[cqa_customer_name]" list = 'project' value="{{$detail.cqa_customer_name}}" style="width:500px;" /> </td>
    </tr>
    
    <tr>
        <th width="100">Question:</th>
          <td width="1100">
           <table  width="1100" id="none-table22"><tr><td>
        <td><textarea cols="120" rows="16" name="{{$TABLE}}[cqa_question]"  id="editor1" class="ckeditor" >{{$detail.cqa_question}}</textarea>
        </td></tr></table>
         </td>
    </tr>        
    <tr>
        <th>Answer:</th>
        <td width="1100">
        <table  width="1100" id="none-table22"><tr><td>
        <textarea cols="120" rows="16" name="{{$TABLE}}[cqa_answer]" id="editor2" class="ckeditor" >{{$detail.cqa_answer|stripslashes}}</textarea>    
        </td></tr></table>
        </td>
    </tr>
  
   <tr>
     <th> Email Date </th>
     <td> <input type="text" name="{{$TABLE}}[cqa_email_date]" value="{{$detail.cqa_email_date}}" class="w16em dateformat-d-ds-m-ds-Y" id="demo4" /> </td>
    </tr>
  
                   
  <tr>
  <th>User Create </th>
  <td> {{$username}} </td>
  </tr>

	   <tr>
     <th> Position Taged:</th>
     <td> <input type="text" name="{{$TABLE}}[cqa_position_taged]" value="{{$detail.cqa_position_taged}}" style="width:400px;"  /> </td>
    </tr>

   <tr>
     <th> Who A:</th>
     <td> <input type="text" name="{{$TABLE}}[cqa_who]" value="{{$detail.cqa_who}}" style="width:400px;"  /> </td>
    </tr>
  
    <tr>
        <td colspan="2" style="text-align:center;">
            <!--<input type="submit" name="print" value="Print" class="vsml" />-->
            <input type="submit" name="subAddDetail" value="Save" class="vsml" />
           <!-- <input type="button" name="btnCancelDetail" value="Cancel" onclick="javascript:parent.$.fancybox.close();" class="vsml" />-->
            <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
        </td>
    </tr>
</table>
</form>
    
    <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("{{$TABLE}}[cqa_customer_name]","req", "Please specify customer name.");
			frmvalidator.addValidation("{{$TABLE}}[cqa_question]","req", "Please specify question.");
			//frmvalidator.addValidation("{{$TABLE}}[qa_answer]","req", "Please specify answer.");
    </script>
</div>