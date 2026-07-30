<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script src="{{$BASE_URL}}ckeditor/ckeditor.js"></script>
<script src="{{$BASE_URL}}ckeditor/samples/js/sample.js"></script>
<link rel="stylesheet" href="{{$BASE_URL}}ckeditor/samples/css/samples.css">
<link rel="stylesheet" href="{{$BASE_URL}}ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css">
    
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

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div align="center" style="min-height:350px;">
<h3 class="page-title">Other Info For {{$list[0].co_company_name}} - {{$list[0].cs_first_name}} {{$list[0].cs_surname}}</h3>   
<form name="other" method="post" action=""  enctype="multipart/form-data"> 
   <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="5%">Emergency</th>
                   <th class="topmenu" align="center" valign="middle" width="12%">Secondary Email</th>    
                   <th class="topmenu" align="center" valign="middle" width="12%">Calendar Link</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Address</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Responsible Status</th>   
                   <th class="topmenu" align="center" valign="middle" width="6%">Notes</th> 
            </tr>
        </thead>
        <tbody>
        
        {{foreach from=$list key="key" item="item"}}
        <tr bgcolor="#FFFFFF">
        <td>{{$item.cs_emergency}} </td>
        <td>{{$item.cs_secondary_email}} </td>
        
        <td>{{$item.cs_calendar_link}}</td>
        <td>{{$item.cs_address}}</td>   
        <td>{{$item.co_resp_status}} </td>
        <td><textarea name="notes" rows="5" cols="50">{{$item.cs_notes}}</textarea></td>
        </tr> 
        {{/foreach}}
        
        </tbody>
   </table> <br />
       <input type="submit" name="subAddDetail" value="Save" class="vsml" />
       <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" /> 
       <input type="submit" name="sendemail" value="Send Email" class="vsml" />
       
      </form> 
</div>

 
    <script type="text/javascript">
		function closepop()
		{
			
		setTimeout('parent.close_win();', 500);
		}
	</script>

<script>
	initSample();
</script>