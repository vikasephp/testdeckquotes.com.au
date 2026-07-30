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
<h3 class="page-title">{{$title}}</h3>    
   <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
              
                   <th class="topmenu" align="center" valign="middle" width="10%">Position</th>   
            	   <th class="topmenu" align="center" valign="middle" width="10%">First Name</th>   
                   <th class="topmenu" align="center" valign="middle" width="10%">Surname</th> 
                   <th class="topmenu" align="center" valign="middle" width="8%">Mobile</th> 
                   <th class="topmenu" align="center" valign="middle" width="8%">Landline</th>  
                   <th class="topmenu" align="center" valign="middle" width="5%">Emergency</th>
                   <th class="topmenu" align="center" valign="middle" width="12%">Primary Email</th> 
                   <th class="topmenu" align="center" valign="middle" width="12%">Secondary Email</th>    
                   <th class="topmenu" align="center" valign="middle" width="6%">Notes</th> 
                   <th class="topmenu" align="center" valign="middle" width="12%">Calendar Link</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Address</th>   
            </tr>
        </thead>
        <tbody>
        
        {{foreach from=$list key="key" item="item"}}
        <tr>
        <td>{{$item.to_option|default:'Others'}} </td>
        <td>{{$item.cs_first_name}} </td>
        <td>{{$item.cs_surname}} </td>
        <td>{{$item.cs_mobile}}</td>
        <td>{{$item.cs_landline}} </td>
        <td>{{$item.cs_emergency}} </td>
        <td>{{$item.cs_primary_email}}</td>
        <td>{{$item.cs_secondary_email}} </td>
        <td> </td>
        <td>{{$item.cs_calendar_link}}</td>
        <td>{{$item.cs_address}}</td>   
        </tr> 
        {{/foreach}}
        
        </tbody>
   </table> <br />
       <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" /> 
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