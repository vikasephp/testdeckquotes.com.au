<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
<script type="text/javascript">
	function DoCustomValidation(){parent.showTop();}		
</script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div id="divbusinessmatchInfoToReturn" align="center">
<form name="buyer_matches" action="{{$BASE_URL}}{{$XFA.businessematches_list}}/bsn_id/{{$bsn_id}}" method="post" onSubmit="parent.showTop();">
<table cellpadding="3" cellspacing="3" width="100%" id="list-table" >
	<tr><th width="100"><div align="right">Search:</div></th>
    	<td width="200"><input type="text" name="bsearch" value="{{$bsearch}}"></td>
        
        <th width="100"><div align="right">Price:</div></th>
    	<td width="200"><input type="text" name="bprice" value="{{$bprice}}"></td>
        <td><input type="submit" value="Search" name="search" ></td></tr>
</table>
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("buyer_matches");
    frmvalidator.EnableMsgsTogether();
	frmvalidator.setAddnlValidationFunction("DoCustomValidation");
    frmvalidator.addValidation("bprice","req", "Please specify price.");
	frmvalidator.addValidation("bprice","num", "Please specify valid price.");

</script>
</form>
{{if $list}}
<table cellpadding="0" cellspacing="0" width="100%" id="list-table" >
		<tr bgcolor="#CCCCCC"><th width="5%">Action</th><th width="15%">Customer Name</th><th width="10%">General Disclaimer</th><th width="20%">Description</th><th width="7%">Price From</th><th width="7%">Price To</th><th width="9%">Created Date</th><th width="10%">Interests</th>	<th width="10%">States</th>	<th width="10%">Notes</th>	
        </tr>
         {{foreach from=$list key="key" item="item"}}
         <tr>
            <th>
    <div align="right">
    <a href="{{$BASE_URL}}customer.detail/bcust_id/{{$item.bm_cust_id}}" title="View" target="_blank">
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>       
    </div>
            </th>
         <td>{{$item.bcust_fname}} {{$item.bcust_lname}}</td>
    <td>{{if $item.bcust_gendec_sent_date !== '0000-00-00'}}{{$item.bcust_gendec_sent_date|date_format:'%d-%m-%Y'}}{{else}}<strong>Not send Yet.</strong>{{/if}}</td>
         <td>{{$item.bm_description}}</td>
         <td>{{$item.bm_from_price}}</td>
         <td>{{$item.bm_to_price}}</td>
		 <td>{{$item.bm_create_date|date_format:'%d-%m-%Y'}}</td>
         <td>{{$item.intrests}}</td>
         <td>{{$item.states}}</td>
         <td>{{$item.bm_note}}</td>
         </tr>
         {{/foreach}}	
	</table>
</div>

  {{if $last > 1}} 
    <table width="100%" border="0" cellpadding="0" cellspacing="0" id="list-table">   
    <tr>  
  {{if $list}}   
<td align="center">
 <div class='pagination'>
 {{if $pagenum == 1}}
 <span class='disabled'>&#171; previous</span>
 {{else}}
<a class="pagination" href="{{$BASE_URL}}{{$XFA.businessematches_list}}/bsn_id/{{$bsn_id}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous">&#171; previous</a>
 {{/if}}   
{{if $pagenum != 1}}
 <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.businessematches_list}}/bsn_id/{{$bsn_id}}/pagenum/1" title="{{$page_num}} Page">1</a></span>
 {{else}}<span class='current'>1</span>
 {{/if}}{{if $pagenum != 2}}
   <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.businessematches_list}}/bsn_id/{{$bsn_id}}/pagenum/2" title="{{$page_num}} Page">2</a></span>
{{else}}<span class='current'>2</span>
 {{/if}}
{{if $paginateprev.0 > 3}}
...
{{/if}}
{{foreach from=$paginateprev key="page_key" item="page_num"}}
	{{if $page_num == $pagenum OR $page_num <= 2}}
   		{{elseif $page_num == $lastone}}
    	{{else}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.businessematches_list}}/bsn_id/{{$bsn_id}}/pagenum/{{$page_num}}" title="{{$page_num}} Page">{{$page_num}}</a></span>
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
                        <a class="pagination"  href="{{$BASE_URL}}{{$XFA.businessematches_list}}/bsn_id/{{$bsn_id}}/pagenum/{{$page_num2}}" title="{{$page_num2}} Page">{{$page_num2}}</a>
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
<a class="pagination"  href="{{$BASE_URL}}{{$XFA.businessematches_list}}/bsn_id/{{$bsn_id}}/pagenum/{{$lastone}}" title="{{$lastone}} Page">{{$lastone}}</a>
{{/if}}
{{/if}}
{{if $last == 1}}
{{elseif $last == 2}}
{{else}}
{{if $pagenum == $last}}
<span class='current'>{{$last}}</span>
{{else}}
 <a class="pagination"  href="{{$BASE_URL}}{{$XFA.businessematches_list}}/bsn_id/{{$bsn_id}}/pagenum/{{$last}}" title="{{$last}} Page">{{$last}}</a>
{{/if}}
{{/if}}
{{if $pagenum == $last}}
<span class='disabled'>next &#187;</span>
 {{else}}
<a class="pagination" href="{{$BASE_URL}}{{$XFA.businessematches_list}}/bsn_id/{{$bsn_id}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next &#187;</a></div>
 {{/if}}
</td>
{{else}}
<td align="center" height="300">Record Not found... </td>
{{/if}}
 </tr>
</table> 
{{/if}}
{{/if}}
</div>
{{if $message}}<table cellpadding="3" cellspacing="3" width="100%" id="list-table" >
<tr><th width="100%"><div align="center">Record Not found... </div></th></tr></table>{{/if}} 