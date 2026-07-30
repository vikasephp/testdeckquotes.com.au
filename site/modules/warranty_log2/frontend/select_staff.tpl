<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script src="{{$BASE_URL}}ckeditor/ckeditor.js"></script>
<script src="{{$BASE_URL}}ckeditor/samples/js/sample.js"></script>
<link rel="stylesheet" href="{{$BASE_URL}}ckeditor/samples/css/samples.css">
<link rel="stylesheet" href="{{$BASE_URL}}ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css">
    
  {{include file=$jdata}}
{{include file=$tiny_basic}} 
    
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


{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div align="center" style="min-height:350px;"><br />
<h3 class="page-title">Contact List</h3>  <br />  
  
  <form name="detail" method="post" action=""  enctype="multipart/form-data" >
   <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
              
                   <th class="topmenu" align="center" valign="middle" width="10%">Position</th>   
            	   <th class="topmenu" align="center" valign="middle" width="10%">First Name</th>   
                   <th class="topmenu" align="center" valign="middle" width="10%">Surname</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Mobile</th> 
                   <th class="topmenu" align="center" valign="middle" width="12%">Primary Email</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Include</th>  
            </tr>
        </thead>
        <tbody>
        
        {{foreach from=$list key="key" item="item"}}
        {{if $item.cs_is_primary eq 1 }}
          <tr bgcolor="#FFFFCC">
        {{else}}  
       <tr bgcolor="#FFFFFF">
       {{/if}}
        <td>{{$item.cs_position}} </td>
        <td>{{$item.cs_first_name}} </td>
        <td>{{$item.cs_surname}} </td>
        <td>{{$item.cs_mobile}}</td>
        <td>{{$item.cs_primary_email}}</td>
	<td>
        <input type="hidden" name="emails[{{$item.cs_id}}]" value="off" />
        <input type="checkbox" name="emails[{{$item.cs_id}}]" {{$item.chk}}  >
        </td>   
        </tr> 
        {{/foreach}}
        
        </tbody>
   </table> <br />
   
	<input type="submit" name="add_emails" value="Save" />
       <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" /> 
</div>
</form>
 </tr>
    <script type="text/javascript">
		function closepop()
		{
			
		setTimeout('parent.close_win();', 500);
		}
	</script>

<script>
	initSample();
</script>