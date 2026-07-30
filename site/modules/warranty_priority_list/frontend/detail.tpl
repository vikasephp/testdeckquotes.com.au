<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />


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
    
     <input type="hidden" name="{{$TABLE}}[wa_image_1]" value="{{$detail.wa_image_1}}" />
     <input type="hidden" name="{{$TABLE}}[wa_image_2]" value="{{$detail.wa_image_2}}" />
     <input type="hidden" name="{{$TABLE}}[wa_image_3]" value="{{$detail.wa_image_3}}" />
     <input type="hidden" name="{{$TABLE}}[wa_image_4]" value="{{$detail.wa_image_4}}" />
     <input type="hidden" name="{{$TABLE}}[wa_image_5]" value="{{$detail.wa_image_5}}" />
    
    
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Project</th>
     <td>
   	<datalist id='project'>
           {{foreach from=$projdetail key="key3" item="item3"}}
            <option value="{{$item3.bsn_name}}" {{if $bsnid eq $item3.bsn_id}} selected="selected" {{/if}}>
            {{$item3.bsn_name}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'project' name="{{$TABLE}}[wa_project]" style ="width:700px" value="{{$detail.wa_project}}" />
      </td>
    </tr>
   
    <tr>
     <th>Type </th>
     <td><select name="{{$TABLE}}[wa_type]" style="width:300px;"/>
      		<!--<option value=""   {{if  $detail.wa_type == ''}}selected{{/if}}>Please Select</option>
                 <option value="Complete"   {{if  $detail.wa_type == 'Complete'}}selected{{/if}}>Complete</option>
                 <option value="In Construction" {{if  $detail.wa_type == 'In Construction'}}selected{{/if}}>In Construction</option>-->
                  <option value="-1" {{if $item.wa_type eq -1}} selected="selected" {{/if}}>Please Select </option>
                {{foreach from = $typedetail key="key4" item="item4"}}
                <option value="{{$item4.wt_type_option}}" {{if $item4.wt_type_option eq $detail.wa_type}} selected="selected" {{/if}}>{{$item4.wt_type_option}}</option>
                {{/foreach}}         
                 
        </select>  
    </td>
    </tr>  
   
    <tr>
     <th>Tenanted </th>
     <td><select name="{{$TABLE}}[wa_tenanted]" style="width:300px;"/>
      		<option value=""   {{if  $detail.wa_tenanted == ''}}selected{{/if}}>Please Select</option>
                 <option value="Yes"   {{if  $detail.wa_tenanted == 'Yes'}}selected{{/if}}>Yes</option>
                 <option value="No" {{if  $detail.wa_tenanted == 'No'}}selected{{/if}}>No</option>
        </select>  
    </td>
    </tr>  
   
   <tr>
   <th>Require Escalation</th>
   <td> 
    <select name="{{$TABLE}}[wa_priority]"  Onchange = "update_priority({{$item.wa_id}},this.value)">
                <option value="-1" {{if $detail.wa_priority eq -1}} selected="selected" {{/if}}>Please Select </option>
                {{foreach from = $prdetail key="key4" item="item4"}}
                <option value="{{$item4.pr_id}}" {{if $item4.pr_id eq $detail.wa_priority}} selected="selected" {{/if}}>{{$item4.pr_priority}}</option>
                {{/foreach}}
        </select>
      
   
   </td>
   </tr>
   
    <tr>
     <th>Date</th>
     <td><input  type="text" name="{{$TABLE}}[wa_date]"  value="{{$detail.wa_date}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> </td>
    </tr>
   
     <tr>
        <th>Problem:</th>
        <td><textarea rows="6" cols="125" name="{{$TABLE}}[wa_problem]" >{{$detail.wa_problem|stripslashes}}</textarea></td>
     </tr>
     
     <tr>
        <th>Solutions:</th>
        <td><textarea rows="6" cols="125" name="{{$TABLE}}[wa_solutions]" >{{$detail.wa_solutions|stripslashes}}</textarea></td>
     </tr>
     
  <tr>
  <th> Upload Image </th> 
  <td> <input type="file" id = "file1" name="image1" onchange="chng1()" />
       <input type="file" id = "file2" name="image2" onchange="chng2()"/>
       <input type="file" id = "file3" name="image3" onchange="chng3()"/>
       <input type="file" id = "file4" name="image4" onchange="chng4()"/>
       <input type="file" id = "file5" name="image5" onchange="chng5()"/>
       
       <script>

    function chng1()
    {
        var type1=document.getElementById("file1").value;
	var res1 = type1.match(".jp");
	var res2 = type1.match(/png/gi);

        if(res1 || res2)
        {
           // alert("sucess");
        }
        else
        {
            alert("Sorry only jpeg or png images are accepted");
            document.getElementById("file1").value=""; 
        }
    }
    
   
    function chng2()
    {
        var type1=document.getElementById("file2").value;
	var res1 = type1.match(".jp");
	var res2 = type1.match(/png/gi);

        if(res1 || res2)
        {
           // alert("sucess");
        }
        else
        {
            alert("Sorry only jpeg or png images are accepted");
            document.getElementById("file2").value=""; 
        }
    }
    
    function chng3()
    {
        var type1=document.getElementById("file3").value;
	var res1 = type1.match(".jp");
	var res2 = type1.match(/png/gi);

        if(res1 || res2)
        {
           // alert("sucess");
        }
        else
        {
            alert("Sorry only jpeg or png images are accepted");
            document.getElementById("file3").value=""; 
        }
    }
    function chng4()
    {
        var type1=document.getElementById("file4").value;
	var res1 = type1.match(".jp");
	var res2 = type1.match(/png/gi);

        if(res1 || res2)
        {
           // alert("sucess");
        }
        else
        {
            alert("Sorry only jpeg or png images are accepted");
            document.getElementById("file4").value=""; 
        }
    }

 function chng5()
    {
        var type1=document.getElementById("file5").value;
	var res1 = type1.match(".jp");
	var res2 = type1.match(/png/gi);

        if(res1 || res2)
        {
           // alert("sucess");
        }
        else
        {
            alert("Sorry only jpeg or png images are accepted");
            document.getElementById("file5").value=""; 
        }
    }
</script>
       
  </td>      
  </tr>
   <tr>
  <th>Image Preview</th>
  <td>
  {{if $detail.wa_image_1}}
     <div style="text-align:left;">Photo 1 :  <a href="https://deckquote.s3.amazonaws.com/files/warranty_log/{{$detail.wa_image_1}}" target="_blank">Preview</a>
     <a href="{{$BASE_URL}}warranty_log.docdelete/id/{{$detail.wa_id}}/p/1"><img src="{{$BASE_URL}}/css/admin/images/deletecross.png" /></a>
     </div>
   {{/if}}
   
    {{if $detail.wa_image_2}}
     <div style="text-align:left;">Photo 2 :  <a href="https://deckquote.s3.amazonaws.com/files/warranty_log/{{$detail.wa_image_2}}" target="_blank">Preview</a>
    <a href="{{$BASE_URL}}warranty_log.docdelete/id/{{$detail.wa_id}}/p/2"><img src="{{$BASE_URL}}/css/admin/images/deletecross.png" /></a>
</div>
   {{/if}}
   
    {{if $detail.wa_image_3}}
     <div style="text-align:left;">Photo 3 :  <a href="https://deckquote.s3.amazonaws.com/files/warranty_log/{{$detail.wa_image_3}}" target="_blank">Preview</a>
    <a href="{{$BASE_URL}}warranty_log.docdelete/id/{{$detail.wa_id}}/p/3"><img src="{{$BASE_URL}}/css/admin/images/deletecross.png" /></a>
</div>
   {{/if}}
   
    {{if $detail.wa_image_4}}
     <div style="text-align:left;">Photo 4 :  <a href="https://deckquote.s3.amazonaws.com/files/warranty_log/{{$detail.wa_image_4}}" target="_blank">Preview</a>
    <a href="{{$BASE_URL}}warranty_log.docdelete/id/{{$detail.wa_id}}/p/4"><img src="{{$BASE_URL}}/css/admin/images/deletecross.png" /></a>
</div>
   {{/if}}
   
    {{if $detail.wa_image_5}}
     <div style="text-align:left;">Photo 5 :  <a href="https://deckquote.s3.amazonaws.com/files/warranty_log/{{$detail.wa_image_5}}" target="_blank">Preview</a>
     <a href="{{$BASE_URL}}warranty_log.docdelete/id/{{$detail.wa_id}}/p/5"><img src="{{$BASE_URL}}/css/admin/images/deletecross.png" /></a>
</div>
   {{/if}} 
  
  </td>
  
  </tr>
  
  <th> Upload Video </th> 
  <td> <input type="file"  name="video_file"  /> </td>      
  </tr>
  
  <!-- <tr>
        <th>Notes:</th>
        <td><textarea rows="6" cols="125" name="{{$TABLE}}[wa_notes]" >{{$detail.wa_notes|stripslashes}}</textarea></td>
     </tr>-->
    
     <tr>
     <th>Quality Inspector contacted client </th>
     <td><input  type="checkbox" name="{{$TABLE}}[wa_qicc]"  {{if $detail.wa_qicc eq 1}} checked="checked" {{/if}}  /> </td>
    </tr>
    
    <tr>
     <th>Date Inspected On site </th>
     <td><input  type="text" name="{{$TABLE}}[wa_date_inspected]"  value="{{$detail.wa_date_inspected}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> </td>
    </tr>
  
    <tr>
     <th>Last Spoken </th>
     <td><input  type="text" name="{{$TABLE}}[wa_last_spoken]"  value="{{$detail.wa_last_spoken}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> </td>
    </tr>
    
    <tr>
     <th>CGFB Person</th>
     <td><input  type="text" name="{{$TABLE}}[wa_cgfb_person]"  value="{{$detail.wa_cgfb_person}}" style="width:700px;" /> </td>
    </tr>
    
       <tr>
     <th>Supplier or Contact</th>
     <td>
     <datalist id='sup'>
           {{foreach from=$compdetail  key="key2" item="item2"}}
            <option value="{{$item2.co_company_name}}" {{if $detail.wa_supplier eq $item2.co_company_name}} selected="selected" {{/if}}>
            {{$item2.co_company_name}}
            </option>
            {{/foreach}}
     </datalist>
         <input type="text" list = 'sup' name="{{$TABLE}}[wa_supplier]" style ="width:700px" value="{{$detail.wa_supplier}}" />

     </td>
    </tr>
    
    <tr>
     <th>Status </th>
     <td><select name="{{$TABLE}}[wa_status]" style="width:300px;"/>
                 <option value="Open"   {{if  $detail.wa_status == 'Open'}}selected{{/if}}>Open</option>
                 <option value="Closed" {{if  $detail.wa_status == 'Closed'}}selected{{/if}}>Closed</option>
        </select>  
    </td>
    </tr> 
    
   <!-- {{if $detail.wa_id ge 1 }} 
     <tr>
     <th><input type="submit" name="trade_resp" value="Trade Responsibility" class="vsml" /></th>
     <td>  
    </td>
    </tr> 
  {{/if}}-->
  
  
    <tr>
        <td colspan="2" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Save" class="vsml" />
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
			frmvalidator.addValidation("{{$TABLE}}[wa_project]","req", "Please specify project.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>


{{if $wa_id}}
<h2 style="text-align:center; font-size:24px;"> View Tasks </h2>

<table id="doclist-table" class="nav-back" width="99%">

    <thead>

      <tr>
        <th class="topmenu" align="center" valign="middle" width="50%">Task</th>
        <th class="topmenu" align="center" valign="middle" width="15%">Complete</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Date</th>
        
       </tr>
     </thead> 
     <tbody> 
      {{foreach from=$taskData key="key" item="item"}}
       <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
      <td>{{$item.wt_task_name}} </td>
      <td>
       <form name ="recmet" method="post" action="">
     	<input type="hidden" name="yesno[{{$item.wt_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="yesno[{{$item.wt_id}}]" value="1"  onclick="this.form.submit();" {{if $item.wd_yes_no  eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
        </label>
       </form>
        
      </td>
      <td>{{if $item.wd_yes_no eq 1 }} {{$item.wd_date}} {{/if}} </td>
      

      </tr> 
      {{/foreach}}
     </tbody>
  </table>   
</div>
<br />
{{/if}}