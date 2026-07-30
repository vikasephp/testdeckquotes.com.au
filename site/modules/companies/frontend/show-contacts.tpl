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

<script type="application/javascript">
function show_notes(coid)
{
	//alert(coid);
	
	var viewurl = "{{$BASE_URL}}contacts.show-notes-content"+ "/co_id/" + coid;	
	//alert(viewurl);
 	$(document).ready(function () {

        $.fancybox({

				'width': '90%',
				'height': '99%',
				'autoScale': false,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'overlayColor' : '#000',
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'type': 'iframe',
				 'href': viewurl,
				 'scrolling': 'yes' 
        });
      });
}

</script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div align="center" style="min-height:350px;"><br />
<h3 class="page-title">Contact List</h3>  <br />  
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
                   <th class="topmenu" align="center" valign="middle" width="10%">Action</th>  
            </tr>
        </thead>
        <tbody>
        
        {{foreach from=$list key="key" item="item"}}
        {{if $item.cs_is_primary eq 1 }}
          <tr bgcolor="#FFFFCC">
        {{else}}  
       <tr bgcolor="#FFFFFF">
       {{/if}}
        <td><!--{{$item.cs_position}}--> {{$item.cp_name}} </td>
        <td>{{$item.cs_first_name}} </td>
        <td>{{$item.cs_surname}} </td>
        <td>{{$item.cs_mobile}}</td>
        <td>{{$item.cs_landline}} </td>
        <td>{{$item.cs_emergency}} </td>
        <td>{{$item.cs_primary_email}}</td>
        <td>{{$item.cs_secondary_email}} </td>
        <td> <a href="{{$BASE_URL}}contacts.show-notes-content/cs_id/{{$item.cs_id}}" class="various" title="Edit"> View </a>
        
      <!--  <input type="button" name="View Notes" value="View  Notes" onclick="javascript:show_notes({{$item.cs_id}});" style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" /></td>
-->        <td>{{$item.cs_calendar_link}}</td>
        <td>{{$item.cs_address}}</td>
        <td> <a href="{{$BASE_URL}}contacts.detail/cs_id/{{$item.cs_id}}" class="various" title="Edit">
    <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
    <a href="{{$BASE_URL}}contacts.delete_contact/cs_id/{{$item.cs_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
    <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a></td>   
        </tr> 
        {{/foreach}}
        
        </tbody>
   </table> <br />
   <span style="margin-right:10px; background: #09F; color:#FFF !important; padding:6px; margin-bottom:5px;"> 
<a href="{{$BASE_URL}}contacts.detail/co_id/{{$co_id}}" class="various" title="Edit" style="color:#FFF; text-decoration:none; font-size:14px;"> Add New Contact </a>
</span>
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