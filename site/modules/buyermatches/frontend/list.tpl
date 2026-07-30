<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/tree/simpletreemenu.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tree/simpletree.css" />
<h3 class="page-title">{{$title}}</h3>
<form name="buyer_match_report" action="{{$BASE_URL}}{{$XFA.list}}" method="post">
<table cellpadding="0" cellspacing="0" width="100%" id="doclist-table" >
                	<tr><th width="150">Keyword Search:</th><td width="600"><input type="text" name="{{$TABLE}}[search]" value="{{$detail.search}}" style="width:400px;"/></td>
                    <th width="80">On Web:</th><td><input type="checkbox" name="{{$TABLE}}[onweb]"  value="1" {{if $detail.onweb == 1}} checked="checked" {{/if}} /></td>
                   </tr>
                    <tr><th>Select Sector(s):</th><td> 
          <div class="scroll_divlist">
                <ul id="treemenu1" class="treeview">
                      {{foreach from=$sub_interest item=item1 key=key1}}
                      <li><input type="checkbox" name="{{$TABLE}}[abc][]"  value="{{$item1.bi_id}}" {{foreach from=$ind_codes key='key' item='item23'}}{{if $item23 == $item1.bi_id}} checked="checked" {{/if}} {{/foreach}} />{{$item1.bi_title}}</li>
                      {{/foreach}}
                </ul>
 <script type="text/javascript">
	ddtreemenu.createTree("treemenu1", true)
</script>
              </div></td>
                    <th colspan="2" rowspan="2"><div style="float:left;">Price Range:</div>
                    	<table width="100%">
 <tr><td colspan="2"><input type="checkbox" name="{{$TABLE}}[bm_price_range][]" value="0-50000" {{if $price_range}}{{foreach from=$price_range key='key' item='item2'}}{{if $item2 == "0-50000"}} checked="checked" {{/if}}{{/foreach}}{{/if}}>&nbsp;$0 - $50,000 </td></tr>
<tr><td colspan="2"><input type="checkbox" name="{{$TABLE}}[bm_price_range][]" value="50000-100000" {{if $price_range}}{{foreach from=$price_range key='key' item='item2'}}{{if $item2 == "50000-100000"}} checked="checked" {{/if}}{{/foreach}}{{/if}}>&nbsp;$50,000 - $100,000 </td></tr>	
<tr><td colspan="2"><input type="checkbox" name="{{$TABLE}}[bm_price_range][]" value="100000-200000" {{if $price_range}}{{foreach from=$price_range key='key' item='item2'}}{{if $item2 == "100000-200000"}} checked="checked" {{/if}}{{/foreach}}{{/if}}>&nbsp;$100,000 - $200,000</td></tr>	
<tr><td colspan="2"><input type="checkbox" name="{{$TABLE}}[bm_price_range][]" value="200000-350000" {{if $price_range}}{{foreach from=$price_range key='key' item='item2'}}{{if $item2 == "200000-350000"}} checked="checked" {{/if}}{{/foreach}}{{/if}}>&nbsp;$200,000 - $350,000</td></tr>	
<tr><td colspan="2"><input type="checkbox" name="{{$TABLE}}[bm_price_range][]" value="350000-5000000" {{if $price_range}}{{foreach from=$price_range key='key' item='item2'}}{{if $item2 == "350000-5000000"}} checked="checked" {{/if}}{{/foreach}}{{/if}}>&nbsp;$350,000 - $500,000</td></tr>	
<tr><td colspan="2"><input type="checkbox" name="{{$TABLE}}[bm_price_range][]" value="500000-750000" {{if $price_range}}{{foreach from=$price_range key='key' item='item2'}}{{if $item2 == "500000-750000"}} checked="checked" {{/if}}{{/foreach}}{{/if}}>&nbsp;$500,000 - $750,000</td></tr>	
<tr><td colspan="2"><input type="checkbox" name="{{$TABLE}}[bm_price_range][]" value="750000-10000000" {{if $price_range}}{{foreach from=$price_range key='key' item='item2'}}{{if $item2 == "750000-10000000"}} checked="checked" {{/if}}{{/foreach}}{{/if}}>&nbsp;$750,000 - $1,000,000</td></tr>	
<tr><td colspan="2"><input type="checkbox" name="{{$TABLE}}[bm_price_range][]" value="1000000-1500000" {{if $price_range}}{{foreach from=$price_range key='key' item='item2'}}{{if $item2 == "1000000-1500000"}} checked="checked" {{/if}}{{/foreach}}{{/if}}>&nbsp;$1,000,000 - $1,500,000</td></tr>	
<tr><td colspan="2"><input type="checkbox" name="{{$TABLE}}[bm_price_range][]" value="1500000-2500000" {{if $price_range}}{{foreach from=$price_range key='key' item='item2'}}{{if $item2 == "1500000-2500000"}} checked="checked" {{/if}}{{/foreach}}{{/if}}>&nbsp;$1,500,000 - $2,500,000</td></tr>	 
<tr><td colspan="2"><input type="checkbox" name="{{$TABLE}}[bm_price_range][]" value="2500000+" {{if $price_range}}{{foreach from=$price_range key='key' item='item2'}}{{if $item2 == "2500000+"}} checked="checked" {{/if}}{{/foreach}}{{/if}}>&nbsp;$2,500,000+</td></tr>	
<tr><td colspan="2">Don't want to, or, can't go over:&nbsp;&nbsp;&nbsp;
<input type="text" name="{{$TABLE}}[bm_price_range_over]" value="{{$detail.bm_price_range_over}}"></td></tr>
                    
                    	</table>
                    </th></tr>
  <tr><th>Planing for new business:</th><td>
  	<table width="100%">
    <tr><td colspan="2"><input type="radio" name="{{$TABLE}}[bm_like_new_business]" value="Within_the_next_4_weeks_(its_urgent)" {{if $detail.bm_like_new_business == "Within_the_next_4_weeks_(its_urgent)"}} checked {{/if}}>&nbsp;Within the next 4 weeks (its urgent) </td></tr>

<tr><td colspan="2"><input type="radio" name="{{$TABLE}}[bm_like_new_business]" value="Within_the_next_3_months_(I_would_like_something_soon)" {{if $detail.bm_like_new_business == "Within_the_next_3_months_(I_would_like_something_soon)"}} checked {{/if}}>&nbsp;Within the next 3 months (I would like something soon) </td></tr>

	
<tr><td colspan="2"><input type="radio" name="{{$TABLE}}[bm_like_new_business]" value="within_the_next_12_months_(i_am_happy_to_take_my_time)" {{if $detail.bm_like_new_business == "within_the_next_12_months_(i_am_happy_to_take_my_time)"}} checked {{/if}}>&nbsp;Within the next 12 months (I am happy to take my time) </td></tr>
	
<tr><td colspan="2"><input type="radio" name="{{$TABLE}}[bm_like_new_business]" value="Doesn't_matter_(No_rush_at_all)" {{if $detail.bm_like_new_business == "Doesn't_matter_(No_rush_at_all)"}} checked {{/if}}>&nbsp;Doesn't matter (No rush at all) </td></tr>
<tr><td colspan="2">&nbsp;&nbsp;&nbsp;I need to be in the business by this date:&nbsp;
      <input type="text" name="{{$TABLE}}[bm_like_new_business_date]" value="{{$detail.bm_like_new_business_date}}"  class="w16em dateformat-d-ds-m-ds-Y"></td></tr>
    </table>
  </td>
  </tr>
  <tr><th></th><td>
  <table width="100%">
  	<tr><td>
    
    
    
Yes <input type="radio" name="{{$TABLE}}[bm_owned_business_before]" value="1" {{if $detail.bm_owned_business_before == 1}} checked="checked" {{/if}}>&nbsp;&nbsp;&nbsp;
        		No <input type="radio" name="{{$TABLE}}[bm_owned_business_before]" value="0" {{if $detail.bm_owned_business_before == 0}} checked="checked" {{/if}}>  &nbsp;Owned a business before.</td></tr>
<tr><td>
Yes <input type="radio" name="{{$TABLE}}[bm_franchise_business]" value="1" {{if $detail.bm_franchise_business == 1}} checked {{/if}}>
 &nbsp;&nbsp;&nbsp;No <input type="radio" name="{{$TABLE}}[bm_franchise_business]" value="0" {{if $detail.bm_franchise_business == 0}} checked {{/if}}>
 &nbsp;&nbsp;&nbsp;Maybe <input type="radio" name="{{$TABLE}}[bm_franchise_business]" value="2" {{if $detail.bm_franchise_business == 2}} checked {{/if}}>&nbsp;Consider purchasing/owning a franchise business.</td></tr><tr><td>
Yes <input type="radio" name="{{$TABLE}}[bm_do_you_need_help]" value="1" {{if $detail.bm_do_you_need_help == 1}} checked {{/if}}>
 &nbsp;&nbsp;&nbsp;No <input type="radio" name="{{$TABLE}}[bm_do_you_need_help]" value="0" {{if $detail.bm_do_you_need_help == 0}} checked {{/if}}>
 &nbsp;&nbsp;&nbsp;Maybe <input type="radio" name="{{$TABLE}}[bm_do_you_need_help]" value="2" {{if $detail.bm_do_you_need_help == 2}} checked {{/if}}> &nbsp;Need help securing or comparing finance for this business purchase.
</td></tr></table>
  </td><th>States:</th><td> 
 
  		{{foreach from=$main_states item=item key=key}}
  		{{counter assign=count print=no}}	
        <input type="checkbox" name="{{$TABLE}}[states][]" value="{{$item.s_id}}" {{foreach from=$states_codes key='key' item='item22'}}
 		{{if $item22 == $item.s_id}} checked="checked" {{/if}} {{/foreach}} />
        {{$item.s_shortcodes}}&nbsp;&nbsp;
          {{if $count % 4 == 0}} <br /><br />{{/if}}
        {{/foreach}}</td>
 </tr>
 <tr><th colspan="4" style="padding-top:10px;"><input type="submit" value="Search" name="buttonname" />&nbsp;<input type="submit" value="Print" name="buttonname" />
 &nbsp;<input type="submit" value="Print & Email" name="buttonname" />
 &nbsp;<input type="reset" value="Reset" name="buttonname" /></th>
</tr>
</table>
</form>

<table id="list-table" class="nav-back" width="100%">
              {{if $list}} 
        <thead>
         <tr><th class="topmenu" align="center" valign="middle">Action</th>
         	<th width="300" class="topmenu" align="center" valign="middle">Description</th>
            <th class="topmenu" align="center" valign="middle">Price Range</th>
            <th class="topmenu" align="center" valign="middle">Created Date</th>
            <th class="topmenu" align="center" valign="middle">Interests</th>
            <th class="topmenu" align="center" valign="middle">States</th>
            <th class="topmenu" align="center" valign="middle">On Web</th></tr>
        <tbody>
        {{foreach from=$list key="key" item="item"}}
           <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}"><td>
           <a href="{{$BASE_URL}}customer.detail/bcust_id/{{$item.bm_cust_id}}"  title="View">
         <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/view.png"/></a>&nbsp;&nbsp;
         </td>
         <td align="left" width="300">{{$item.bm_description}}</td>
         <td>{{$item.price_ranges}}</td>
         <td>{{$item.bm_create_date|date_format:'%m/%d/%Y'}}</td>
         <td>{{$item.intrest_code}}</td>
         <td>{{$item.states_code}}</td>
          <td><input type="checkbox" {{if $item.bm_onweb == 1}} checked="checked" {{/if}} disabled="disabled" /></td>
        </tr>
        {{/foreach}}
        </tbody>
        {{elseif $listcount > 0}}
        <tr><th class="topmenu" align="center" valign="middle">Record Not found...</th></tr>
        
        {{/if}}
    </table>
  {{if $last > 1}} 
    <table width="100%" border="0" cellpadding="0" cellspacing="0">   
    <tr>  
  {{if $list}}   
<td align="center">

 <div class='pagination'>
 {{if $pagenum == 1}}
 <span class='disabled'>« previous</span>
 {{else}}
<a class="pagination" href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous">« previous</a>
 {{/if}}
        
{{if $pagenum != 1}}
 <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/1" title="{{$page_num}} Page">1</a></span>
 {{else}}<span class='current'>1</span>
 {{/if}}{{if $pagenum != 2}}
   <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/2" title="{{$page_num}} Page">2</a></span>
{{else}}<span class='current'>2</span>
 {{/if}}
{{if $paginateprev.0 > 3}}
...
{{/if}}
{{foreach from=$paginateprev key="page_key" item="page_num"}}
	{{if $page_num == $pagenum OR $page_num <= 2}}
   		{{elseif $page_num == $lastone}}
    
    	{{else}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{$page_num}}" title="{{$page_num}} Page">{{$page_num}}</a></span>
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
                        <a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{$page_num2}}" title="{{$page_num2}} Page">{{$page_num2}}</a>
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
<a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{$lastone}}" title="{{$lastone}} Page">{{$lastone}}</a>
{{/if}}
{{/if}}
{{if $last == 1}}
{{elseif $last == 2}}
{{else}}
{{if $pagenum == $last}}
<span class='current'>{{$last}}</span>
{{else}}
 <a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{$last}}" title="{{$last}} Page">{{$last}}</a>
{{/if}}
{{/if}}
{{if $pagenum == $last}}
<span class='disabled'>next »</span>
 {{else}}
<a class="pagination" href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next »</a></div>
 {{/if}}
</td>
{{else}}
<td align="center" height="300">Record Not found... </td>

{{/if}}
 </tr>
</table> 
{{/if}}

