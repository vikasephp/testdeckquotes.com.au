<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv4.js"></script>

 <!--[if lt IE 7]><script type="text/javascript" src="http://info.template-help.com/files/ie6_warning/ie6_script_other.js"></script><![endif]-->
 <!--[if lt IE 9]><script type="text/javascript" src="{{$BASE_URL}}js/html5.js"></script><![endif]-->

<script type="text/javascript" src="{{$BASE_URL}}js/jquery.jqtransform.js" ></script>
<script type="text/javascript">
	$(function(){
		$('#search-form').jqTransform({imgPath:'jqtransformplugin/img/'});
	});
</script>

<div class="page_spinner"></div>
<div class="extra">
 <div align="center" > 
	<article id="content1">
       {{include file=$mainmenu}}
          <div class="page_content"> 
          <ul style="padding-top:5px; text-align:left;">
       		<li id="page_packaging">
  			  <div class="wrapper contentPad">
				<div class="col11">                   
                                
<table cellpadding="0" cellspacing="0" border="0" style="margin-top:15px;">
<tr>
    <td width="200" style="padding-top:8px;">
    <strong  style="float:left;font-size:16px; font-weight:bold; padding-left:10px;">{{$title}}</strong>
    </td>
    <td width="85" style="padding-top:8px;">Sort By Price: </td>
    <td>  
    <form action="" method="post" name="order">
    <select name="order" class="select" onchange="submit();">
    <option  value="ASC"  style="padding-left:8px; padding-bottom:5px;" {{if $last_order == 'ASC'}} selected="selected" {{/if}}>Ascending</option>
    <option value="DESC" style="padding-left:8px; padding-bottom:3px;" {{if $last_order == 'DESC'}} selected="selected" {{/if}}>Descending</option>
    </select>
     </form>
    </td>
</tr>
</table>
   <br />
   
    <table width="900" border="0" cellspacing="0" cellpadding="0" align="left" height="100%" >
	<tr> 
    <td style="width:280px;">
    
   {{include file=$search}}
        
    </td>
    <td>
    <table width="610" border="0" cellspacing="0" cellpadding="0" align="left" height="100%" style="margin-left:10px;" >
    
    {{if $list}}
                     
    {{foreach from=$list key="key" item="item"}}
       <tr>
       <td align="left" valign="middle">
           <table cellpadding="0" cellspacing="0" border="0" height="100%">
           <tr>
           <td width="185" style="padding:5px;">
              <div style="width:100px;">
                 <a href="{{$BASE_URL}}{{$XFA.property}}/adv_id/{{$item.adv_id}}">
                 <img  src="{{$BASE_URL}}upload/thumb/thumb_{{$item.list_image|default:'no_image.png'}}" class="limg" />
                 </a>
              </div>
           </td>
           <td width="450">
              <div>
                 <div style="font-size:15px; color: #FFFFFF;">
                 <a href="{{$BASE_URL}}{{$XFA.property}}/adv_id/{{$item.adv_id}}" style="color:#FFFFFF;">{{$item.adv_title|stripcslashes}}</a>
                 </div>
                 <div style="font-size:13px; color:#999999; padding-top:10px; padding-bottom:5px; padding-right:10px;">	
                     {{$item.adv_listing_summery|truncate:400:"..."}}
                 </div>
                 <div class="lists"> Sale Status : {{if $item.adv_sale_status eq 1}} In Preparation {{elseif $item.adv_sale_status eq 2 }} For Sale {{elseif $item.adv_sale_status eq 3 }} Under Offer {{elseif $item.adv_sale_status eq 4 }} Sold {{/if}}
                 </div>
                 <div class="lists"> Sale Method : {{$item.adv_sale_method}} </div>
                 <div class="lists" style="padding-bottom:7px;"> Investment Amount : {{$item.adv_iaa}} </div>
                  
					<!--  <div class="lists" >
                                {{if $item.adv_ilmin >0 || $item.adv_ila > 0}}  
                                        Price:&nbsp;&nbsp;&nbsp;
                                        {{if $item.adv_ilmin > 0}}            
                                        ${{$item.adv_ilmin|number_format:2}} - ${{$item.adv_ilamax|number_format:2}}{{/if}}
                                        {{if $item.adv_ila > 0}}${{$item.adv_ila|number_format:2}}{{/if}}
                                {{/if}}
                           </div>-->
           
                    <div class="lists"> Industry Codes:&nbsp;{{$item.ind_codes_name}} </div>
                    <div class="lists"> Location:&nbsp;{{$item.adv_suburb}},&nbsp;{{$item.s_name}} </div> 
                    <div class="lists"> Business Type:&nbsp;{{if $item.adv_business_type eq 1}}Established {{elseif $item.adv_business_type eq 2}} Non Franchise {{elseif $item.adv_business_type eq 3}} Freehold{{/if}}
                    <br /><br />
                    </div> 
              </div>
           </td>
           <td width="75" valign="bottom" style="border:0px solid #F00;">
             <span style="float:right; padding-right:10px;"><a href="{{$BASE_URL}}{{$XFA.property}}/adv_id/{{$item.adv_id}}">See More</a></span>
           </td>
        </tr>
       </table>
              </td>
              </tr>
              <tr>
                   <td><hr style="border: 1px solid #991a33; margin-left:5px; margin-bottom:5px;"/><br /></td>
              </tr>
              {{/foreach}}
              {{else}}
              <tr><td colspan="5" height="200" style="padding:100px 0 0 0px; margin-left:40px; color:#F00;font-size:18px; border:1px solid #999; text-align:center">Sorry no business listings matched your search enquiry. <br /><br />Please try again, or email sales@capitalcommercial.com.au <br /><br />outlining what you are specifically looking for.</td></tr>
              
              {{/if}}
            </table>
            </td>
            </tr>
            </table>
            
            {{if $last > 1}}
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr> 
                <td align="center">
                <div class='pagination'> 
                {{if $pagenum == 1}} 
                		<span class='disabled'>&#171; previous</span> 
                {{else}} 
                		<a class="pagination" href='{{$BASE_URL}}{{$XFA.list}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}{{$url2}}{{$p_url}}' title="Previous">&#171; previous</a> 
                {{/if}}
                    
                 {{if $pagenum != 1}} 
                 <span class="paginate"><a class="pagination"  href='{{$BASE_URL}}{{$XFA.list}}/pagenum/1{{$url2}}{{$p_url}}' title="{{$page_num}} Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a class="pagination"  href='{{$BASE_URL}}{{$XFA.list}}/pagenum/2{{$url2}}{{$p_url}}' title="{{$page_num}} Page">2</a></span> {{else}}<span class='current'>2</span> 
                 {{/if}}
                  {{if $paginateprev.0 > 3}}
                    ...
                  {{/if}}
                    {{foreach from=$paginateprev key="page_key" item="page_num"}}
                    {{if $page_num == $pagenum OR $page_num <= 2}}
                    {{elseif $page_num == $lastone}}
                    
                    {{else}} <span class="paginate"><a class="pagination"  href='{{$BASE_URL}}{{$XFA.list}}/pagenum/{{$page_num}}{{$url2}}{{$p_url}}' title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
                    {{/foreach}}
                    
                    {{foreach from=$paginatenext key="page_key" item="page_num2"}}
                    {{if $page_num2 < $last AND $page_num2 != $lastone}}
                    {{if $page_num2 == 1}}
                    {{elseif $page_num2 == 2}}
                    {{else}}
                    {{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'> {{$page_num2}}</span> {{else}} <a class="pagination"  href='{{$BASE_URL}}{{$XFA.list}}/pagenum/{{$page_num2}}{{$url2}}{{$p_url}}' title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
                    {{/if}}     
                    {{/if}}
                    {{/foreach}}
                    {{if $page_num2 < $lasttow}}
                    ...
                    {{/if}}
                    {{if $lastone == 1}}
                    {{elseif $lastone == 2}}
                    {{else}}
                    {{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span> {{else}} <a class="pagination"  href='{{$BASE_URL}}{{$XFA.list}}/pagenum/{{$lastone}}{{$url2}}{{$p_url}}' title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
                    {{/if}}
                    {{if $last == 1}}
                    {{elseif $last == 2}}
                    {{else}}
                    {{if $pagenum == $last}} <span class='current'>{{$last}}</span> {{else}} <a class="pagination"  href='{{$BASE_URL}}{{$XFA.list}}/pagenum/{{$last}}{{$url2}}{{$p_url}}' title="{{$last}} Page">{{$last}}</a> {{/if}}
                    {{/if}}
                    {{if $pagenum == $last}} <span class='disabled'>next &#187;</span> {{else}} <a class="pagination" href='{{$BASE_URL}}{{$XFA.list}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}{{$url2}}{{$p_url}}' title="Next">next &#187;</a>              
                </div>
                {{/if}} </td>
</tr>
            </table>
            {{/if}} 
		     </table>
				 </div>
				</li>
               </ul>
              </div>
	 		</article>
	</div>
</div>