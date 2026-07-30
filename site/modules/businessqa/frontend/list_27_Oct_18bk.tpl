<script type="text/javascript" > 
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
	</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<script type="text/javascript" >  

		$(document).ready(function() {
			/*
			*   Examples - images
			*/
			$(".various").fancybox({
				'width': '78%',
				'height': '47%',
				'autoScale': false,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'type': 'iframe',
				 'scrolling': 'no' 
			});

		
		});
		
	function view_enquiry(busid, custid, buse_id)
				{
				var viewurl ="{{$BASE_URL}}business.businessenquiry_detail/buse_id/" +busid+"/cust_id/"+custid+"/buse_id/"+buse_id;
						$(document).ready(function () {
						$.fancybox({
								'width': '88%',
								'height': '100%',
								'autoScale': false,
								 'transitionIn' : 'elastic',
								 'transitionOut' : 'elastic',
								 'speedIn' : 300,
								 'speedOut' : 300,
								 'overlayShow' : true,
								 'hideOnOverlayClick':false,
								 'hideOnContentClick':false,
								 'type': 'iframe',
								  'href': viewurl,
								 'scrolling': 'yes' 
							});
				
						
						});
				}		
function clearform()
{
var frm_elements = document.search.elements;

for(i=0; i<frm_elements.length; i++)
{   
    if(frm_elements[i].type=="text")
	{    frm_elements[i].value="";}
	if(frm_elements[i].type=="radio")
	{    frm_elements[i].checked=false;}
	document.getElementById("selectionDD").selectedIndex = 0;}
}
		
</script>
<div class="page-title" style="height:50px;">{{$title}}</div>
<div style="float:left; width:100%;">
  <table id="search-table" width="98%">
    <form name="search" action="{{$XFA.list}}" method="post">
      <thead>
        <tr>
         <th align="center" width="20%">Search By Project Name:&nbsp;</th>
          <td><input type="text" style="width:200px;" name="{{$TABLE}}[bsn_name]" value="{{$detail.bsn_name}}"/>
          </td>
          <th  width="20%">Search By Customer Name:&nbsp;</th>
          <td><input type="text" style="width:200px;" name="{{$TABLE}}[bcust_name]" value="{{$detail.bcust_name}}" />
          </td>
          <th width="5%"><div align="center"><b>OR</b></div></th>
         
          <th align="center" width="5%">Short:&nbsp;</th>
          <td><select name="{{$TABLE}}[qa_type]">
              <option value="All" {{if $detail.qa_type == "All"}} selected="selected" {{/if}}>--All--</option>
              <option value="ANSWERED" {{if $detail.qa_type == "ANSWERED"}} selected="selected" {{/if}}>ANSWERED</option>
              <option value="UNANSWERED" {{if $detail.qa_type == "UNANSWERED"}} selected="selected" {{/if}}>UNANSWERED</option>
            </select></td>
          <td> <input type="submit" name="search" value="Search" /></td>
          <!--<td><div><input type="submit" value="Export to XLS" name="search" /></div></td>-->
        </tr>
      </thead>
    </form>
  </table>
  {{if $list}}
  <table id="list-table" class="nav-back" width="98%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="3%">Sr. No.</th>
        <th class="topmenu" align="center" valign="middle" width="15%">Business Name</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Customer Name</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Position Appointed</th>
        <th class="topmenu" align="center" valign="middle" width="24%">Question</th>
        <th class="topmenu" align="center" valign="middle" width="24%">Answer</th>
        <th class="topmenu" align="center" valign="middle" width="6%"><a href="{{$BASE_URL}}{{$XFA.list}}/orderby/{{$ord}}" title="{{$ord}}">Que. Date</a></th>
        <th class="topmenu" align="center" valign="middle" width="6%">Ans. Date</th>
      </tr>
    </thead>
    <tbody>
    {{foreach from=$list key="key" item="item"}}
    <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
      <td><div align="center">{{counter assign=count}}{{assign var="iSum" value=$lastcount+$count}} {{$iSum}}</div></td>
      <td><a href="{{$BASE_URL}}business.detail/bsn_id/{{$item.bsn_id}}" target="_blank">{{$item.bsn_name}}</a></td>
      <td><a href="{{$BASE_URL}}customer.detail/bcust_id/{{$item.bcust_id}}" target="_blank">{{$item.bcust_fname}} &nbsp;{{$item.bcust_lname}}</a></td>
      <td>{{$item.p_name}}</td>
      <td>{{$item.bqa_que|stripslashes}}</td>
      <td>{{$item.bqa_ans|stripslashes}}</td>
      <td>{{if $item.bqa_created_date !== '0000-00-00'}}{{$item.bqa_created_date|date_format:"%d-%m-%Y"}}{{/if}}</td>
      <td> {{if $item.bqa_ans_date !== '0000-00-00'}}{{$item.bqa_ans_date|date_format:"%d-%m-%Y"}}{{/if}} </td>
    </tr>
    
    {{/foreach}}
    </tbody>
    
  </table>
  {{/if }}   
  {{if $last > 1}}
  <table width="90%" border="0" cellpadding="0" cellspacing="0">
    <tr> {{if $list}}
      <td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>« previous</span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous">« previous </a> {{/if}}
          
          {{if $pagenum != 1}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/1" title="{{$page_num}} Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/2" title="{{$page_num}} Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
          {{if $paginateprev.0 > 3}}
          ...
          {{/if}}
          {{foreach from=$paginateprev key="page_key" item="page_num"}}
          {{if $page_num == $pagenum OR $page_num <= 2}}
          {{elseif $page_num == $lastone}}
          
          {{else}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{$page_num}}" title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
          {{/foreach}}
          
          {{foreach from=$paginatenext key="page_key" item="page_num2"}}
          {{if $page_num2 < $last AND $page_num2 != $lastone}}
          {{if $page_num2 == 1}}
          {{elseif $page_num2 == 2}}
          {{else}}
          {{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'> {{$page_num2}}</span> {{else}} <a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{$page_num2}}" title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
          {{/if}}     
          {{/if}}
          {{/foreach}}
          {{if $page_num2 < $lasttow}}
          ...
          {{/if}}
          {{if $lastone == 1}}
          {{elseif $lastone == 2}}
          {{else}}
          {{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span> {{else}} <a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{$lastone}}" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
          {{/if}}
          {{if $last == 1}}
          {{elseif $last == 2}}
          {{else}}
          {{if $pagenum == $last}} <span class='current'>{{$last}}</span> {{else}} <a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{$last}}" title="{{$last}} Page">{{$last}}</a> {{/if}}
          {{/if}}
          {{if $pagenum == $last}} <span class='disabled'>next »</span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next »</a></div>
        {{/if}} </td>
      {{else}}
      <td align="center" height="300">Record Not found... </td>
      {{/if}} </tr>
  </table>
  {{/if}} </div>
