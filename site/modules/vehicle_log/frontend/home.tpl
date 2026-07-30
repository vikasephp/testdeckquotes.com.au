<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/w3.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}	
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
	
<h3 class="page-title">{{$title}}</h3>


<script type="text/javascript">
$(function(){
    $(".wrapper1").scroll(function(){
        $(".wrapper2")
            .scrollLeft($(".wrapper1").scrollLeft());
    });
    $(".wrapper2").scroll(function(){
        $(".wrapper1")
            .scrollLeft($(".wrapper2").scrollLeft());
    });
});
</script>

<script>
function add_procedure()
{
	var viewurl = "{{$BASE_URL}}vehicle_log.view_procedure"+ "/random/" + Math.random();	

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

<style>
.tableFixHead          { overflow-y: auto; height: 400px; }
.tableFixHead thead th { position: sticky; top: 0; text-align:left; }

table  { border-collapse: collapse; width: 100%; }
th     { z-index:9999; }

.wrapper1, .wrapper2{width: 100%; border: none 0px RED; overflow-x: scroll; overflow-y:hidden; scrollbar-color: yellow blue; }
.wrapper1{height: 20px; }
.wrapper2{ }
.div1 {width:2700px; height: 20px; }
.div2 {width:2700px;  overflow: auto;}  
#fancybox-wrap {z-index:9999999;}  
</style>

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:left; text-align:left;"> 
&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> <br />
<input type="text" name="searchkey" value="{{$searchkey}}" style="width:400px;" placeholder="Search by Make & Model or Registration Number"/>
<input type="submit" value="Search" name="searchaddr"  />

&nbsp;&nbsp;&nbsp;&nbsp;
 <select name="daycnt"  >
         <option value="">Select Date Count </option>
         <option value="30" {{if $daycnt eq 30}} selected="selected" {{/if}}>Less than 30 days</option>
	 <option value="10" {{if $daycnt eq 10}} selected="selected" {{/if}}>Less than 10 days</option>
</select>
 <input type="submit" value="Filter" name="project_filter"  />
 
 &nbsp;&nbsp;

 <input type="submit" value="Clear All" name="clear"  />
 
</div>
<div style="float:right; margin-right:80px;"> 
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
<input type="button" value="Export To Excel" onclick="document.location.href='{{$BASE_URL}}vehicle_log.home/export/1'" />
</div>
</form>

<br />
<div class="wrapper1">
    <div class="div1">
    </div>
</div>

<div style="border:1px solid black;width:auto;height:auto;overflow-y:hidden;overflow-x:scroll;">
  <div class="div2 tableFixHead">


  <table id="doclist-table" class="nav-back tableFixHead" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="3%">Sr No</th>  
                   <th class="topmenu" align="center" valign="middle" width="9%">Vehicle Make & Model</th>   
            	   <th class="topmenu" align="center" valign="middle" width="6%">Vehicle Photo</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">Registration Number</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">Registration Expire Date</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Date Count</th> 
                   <th class="topmenu" align="center" valign="middle" width="7%">3rd Party Insurer</th>
                   <th class="topmenu" align="center" valign="middle" width="4%">CTP Insurance</th>
                   <th class="topmenu" align="center" valign="middle" width="6%">Insurance Policy Number</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">CTP Insurance Expire Date</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">Maintenance Company</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">Last Maintenance Date</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">Copy of Registration Document</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">Copy of Insurance Document</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">Proof of Purchase</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">Action</th>   
            </tr>
        </thead>
    <tbody>

 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

        <td>{{counter}}</td>
         <td>{{$item.ve_make_model}}</td>
         <td>{{if $item.ve_photo}}
         <img  data-img-name="{{$item.ve_photo}}" data-img-id="{{$item.ve_photo}}-{{ $item.ve_reg_number }}" src="/vehicle_log.download_content?file_name={{$item.ve_photo}}&module_name=vehicle_log.home" style="width:100%;cursor:pointer; padding:2px;" 
    onclick="onClick(this)" class="w3-hover-opacity" />{{/if}}
    {{if $item.ve_photo2}}
    <img  data-img-name="{{$item.ve_photo2}}" data-img-id="{{$item.ve_photo2}}-{{ $item.ve_reg_number }}" src="/vehicle_log.download_content?file_name={{$item.ve_photo2}}&module_name=vehicle_log.home" style="width:100%;cursor:pointer; padding:2px;" 
    onclick="onClick(this)" class="w3-hover-opacity" />{{/if}}
    {{if $item.ve_photo3}}
    <img  data-img-name="{{$item.ve_photo3}}" data-img-id="{{$item.ve_photo3}}-{{ $item.ve_reg_number }}" src="/vehicle_log.download_content?file_name={{$item.ve_photo3}}&module_name=vehicle_log.home" style="width:100%;cursor:pointer; padding:2px;" 
    onclick="onClick(this)" class="w3-hover-opacity" />{{/if}}
    </td>
        <td>{{$item.ve_reg_number}}</td>
		
		{{assign var="exp_date" value=$item.ve_reg_exp_date|date_format:"%Y-%m-%d"}}
		{{assign var="today" value="now"|date_format:"%Y-%m-%d"}}
		{{assign var="plus10" value="+10 days"|date_format:"%Y-%m-%d"}}
		{{assign var="plus30" value="+30 days"|date_format:"%Y-%m-%d"}}

		{{assign var="bgcolor" value=""}}
		{{assign var="color" value=""}}

		{{if $exp_date < $today}}
			{{assign var="bgcolor" value="yellow"}}
		{{elseif $exp_date <= $plus10}}
			{{assign var="bgcolor" value="red"}}
			{{assign var="color" value="white"}}
		{{elseif $exp_date <= $plus30}}
			{{assign var="bgcolor" value="purple"}}
			{{assign var="color" value="white"}}
		{{/if}}
        <td {{if $bgcolor}}style="background-color: {{$bgcolor}}; color: {{$color}};"{{/if}}>{{$item.ve_reg_exp_date}}</td>
        <td>{{$item.dayscount}}</td>
        <td>{{$item.ve_3rd_party_insurer}}</td>
        <td>{{$item.ve_ctp_insurance}}</td>
        <td>{{$item.ve_insu_policy_number}}</td>
		
		{{assign var="ctp_exp_date" value=$item.ve_ctp_insu_expire_date|date_format:"%Y-%m-%d"}}
		{{assign var="ctp_today" value="now"|date_format:"%Y-%m-%d"}}
		{{assign var="ctp_plus10" value="+10 days"|date_format:"%Y-%m-%d"}}
		{{assign var="ctp_plus30" value="+30 days"|date_format:"%Y-%m-%d"}}

		{{assign var="ctp_bgcolor" value=""}}
		{{assign var="ctp_color" value=""}}

		{{if $ctp_exp_date < $ctp_today}}
			{{assign var="ctp_bgcolor" value="yellow"}}
		{{elseif $ctp_exp_date <= $ctp_plus10}}
			{{assign var="ctp_bgcolor" value="red"}}
			{{assign var="ctp_color" value="white"}}
		{{elseif $ctp_exp_date <= $ctp_plus30}}
			{{assign var="ctp_bgcolor" value="purple"}}
			{{assign var="ctp_color" value="white"}}
		{{/if}}
        <td {{if $ctp_bgcolor}}style="background-color: {{$ctp_bgcolor}}; color: {{$ctp_color}};"{{/if}}>{{$item.ve_ctp_insu_expire_date}}</td>
        <td>{{$item.ve_maint_comp}}</td>
        <td>{{$item.ve_last_maint_date}}</td>
        <td {{if !$item.ve_copy_reg_doc}}style="background-color:#00CC33;"{{/if}}>{{if $item.ve_copy_reg_doc}}
      <!--  <a href = "https://deckquote.s3.amazonaws.com/files/uploads/{{$item.ve_copy_reg_doc}}" target="_blank">Download</a>-->
        <a href="/vehicle_log.download_content?file_name={{$item.ve_copy_reg_doc}}&module_name=vehicle_log.home" target="_blank">Download</a>
        
        
        {{/if}}</td>
        <td {{if !$item.ve_copy_insu_doc}}style="background-color:#00CC33;"{{/if}}>{{if $item.ve_copy_insu_doc}}
     <!--   <a href = "https://deckquote.s3.amazonaws.com/files/uploads/{{$item.ve_copy_insu_doc}}" target="_blank">Download</a>-->
        <a href="/vehicle_log.download_content?file_name={{$item.ve_copy_insu_doc}}&module_name=vehicle_log.home" target="_blank">Download</a>
        
        {{/if}}</td>
        <td>
        <form name="proof" method="post" action="" enctype="multipart/form-data">
        <input type="hidden" name="ve_id" value="{{$item.ve_id}}" />
        <input type="file" name="proof" />
        <input type="submit" name="upload" value="Upload" />
        </form>
        {{if $item.ve_pur_proof}}
        <!--<a href = "https://deckquote-new.s3.amazonaws.com/files/uploads/{{$item.ve_pur_proof}}" target="_blank">Download</a>-->
         <a href="/vehicle_log.download_content?file_name={{$item.ve_pur_proof}}&module_name=vehicle_log.home" target="_blank">Download</a>
        {{/if}}
        </td>
    
    
        <td> <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;&nbsp
        </td>
    </tr>  
  {{/foreach}}
  </tbody>
  </table>
         
<div id="modal01" class="w3-modal" onclick="this.style.display='none'" style="z-index:999999">
  <span class="w3-button w3-hover-red w3-xlarge w3-display-topright">&times;</span>
  <div class="w3-modal-content w3-animate-zoom">
    <img id="img01" style="width:100%;">
  </div>
</div>

<script>
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
}
</script>
    
   
    
     {{if $last > 1}} 
    <table width="90%" border="0" cellpadding="0" cellspacing="0">   
    <tr>  
  {{if $list}}   
<td align="center">
 <div class='pagination'>
 {{if $pagenum == 1}}
 <span class='disabled'>&#171; previous</span>
 {{else}}
<a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous">&#171; previous</a>
 {{/if}}
        
{{if $pagenum != 1}}
 <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/1" title="{{$page_num}} Page">1</a></span>
 {{else}}<span class='current'>1</span>
 {{/if}}{{if $pagenum != 2}}
   <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/2" title="{{$page_num}} Page">2</a></span>
{{else}}<span class='current'>2</span>
 {{/if}}
{{if $paginateprev.0 > 3}}
...
{{/if}}
{{foreach from=$paginateprev key="page_key" item="page_num"}}
	{{if $page_num == $pagenum OR $page_num <= 2}}
   		{{elseif $page_num == $lastone}}
    
    	{{else}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num}}" title="{{$page_num}} Page">{{$page_num}}</a></span>
        {{/if}}
        {{/foreach}}

{{foreach from=$paginatenext key="page_key" item="page_num2"}}
  	{{if $page_num2 < $last AND $page_num2 != $lastone}}
    			{{if $page_num2 == 1}}
                {{elseif $page_num2 == 2}}
                {{else}}
                    {{if $page_num2 == $pagenum OR $page_num2 <= 0}}
                            <span class='current'> {{$page_num2}}</span>
                    {{else}}
                        <a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num2}}" title="{{$page_num2}} Page">{{$page_num2}}</a>
                     {{/if}}
                {{/if}}     
    {{/if}}
{{/foreach}}
{{if $page_num2 < $lasttow}}
...
{{/if}}
{{if $lastone == 1}}
{{elseif $lastone == 2}}
{{else}}
{{if $pagenum == $lastone }}
<span class='current'>{{$lastone}}</span>
{{else}}
<a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$lastone}}" title="{{$lastone}} Page">{{$lastone}}</a>
{{/if}}
{{/if}}
{{if $last == 1}}
{{elseif $last == 2}}
{{else}}
{{if $pagenum == $last}}
<span class='current'>{{$last}}</span>
{{else}}
 <a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$last}}" title="{{$last}} Page">{{$last}}</a>
{{/if}}
{{/if}}
{{if $pagenum == $last}}
<span class='disabled'>next &#187;</span>
 {{else}}
<a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next &#187;</a></div>
 {{/if}}
</td>
{{else}}
<td align="center" height="300">Record Not found... </td>
{{/if}}
 </tr>
</table> 
{{/if}}
</div>
</div>
<script type="text/javascript">

   function get_img_raw_data(myKeyVals){
      $.ajax({
              type: 'POST',
              url: '/vehicle_log.get_image_raw_data',
              data: myKeyVals,
              dataType: "json",
              success: function(resultData) 
              {
              	if(resultData.status == 'true')
              	{ 
              	    var img_raw_data = resultData.data.rawImgData;
              	    var file_name = resultData.data.fileName;
              	    var file_id = resultData.data.id;
              	    $('#doclist-table img[data-img-id="'+file_id+'"]').attr("src",img_raw_data);
              	}
              }
        });
    }
    $(document).ready(function(){
        $("#doclist-table tr img.w3-hover-opacity").each(function(){
            var file_name = $.trim( $(this).attr("data-img-name") )
            var id = $.trim( $(this).attr("data-img-id") );
            var myKeyVals = { "file_name":file_name ,"id":id } ;
            get_img_raw_data(myKeyVals);
        })
    })
</script> 