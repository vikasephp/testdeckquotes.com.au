{{include file=$jdata}}
{{include file=$tiny_basic}}

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
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
				'height': '90%',
				'autoScale': false,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'type': 'iframe',
				 'scrolling': 'yes' 
			});

		
		});
		
		
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
	

function add_procedure()
{
	var viewurl = "{{$BASE_URL}}businessqa.view_procedure"+ "/random/" + Math.random();	

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
<div class="page-title" style="height:50px;">{{$title}}</div>
<div style="float:left;  text-align:left;">
&nbsp;&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" />  <br />
    <form name="search" action="{{$XFA.list}}" method="post">
     <strong>&nbsp;&nbsp;Search By Project Name:&nbsp;</strong>
            
      <datalist id='project'>
           {{foreach from=$projdetail key="key3" item="item3"}}
            <option value="{{$item3.bsn_name}}" {{if $bsnid eq $item3.bsn_id}} selected="selected" {{/if}}>
            {{$item3.bsn_name}}
            </option>
            {{/foreach}}
  	 </datalist>
          <input type="text" list = 'project' name="{{$TABLE}}[bsn_name]"  style="width:400px;"  /><br />
  
   <strong>&nbsp;&nbsp;Search By Customer Name:&nbsp;</strong> 
  <input type="text" style="width:200px;" name="{{$TABLE}}[bcust_name]" value="{{$detail.bcust_name}}" /> <br />
  
  <strong>&nbsp;&nbsp;Search By Position:&nbsp;</strong> 
  <input type="text" style="width:180px;" name="{{$TABLE}}[p_name]" value="{{$detail.p_name}}" /> <br />
 <strong>&nbsp;&nbsp;Filter By:&nbsp;</strong> 
  <select name="{{$TABLE}}[qa_type]">
              <option value="All" {{if $detail.qa_type == "All"}} selected="selected" {{/if}}>--All--</option>
              <option value="ANSWERED" {{if $detail.qa_type == "ANSWERED"}} selected="selected" {{/if}}>ANSWERED</option>
              <option value="UNANSWERED" {{if $detail.qa_type == "UNANSWERED"}} selected="selected" {{/if}}>UNANSWERED</option>
  </select>
  <input type="submit" name="search" value="Search" />
          <input type="submit" name="clear_search" value = "Clear Search" />
</div>        
          
 <div style="float:right; margin-right:2%;">
 <input type="submit" value="Export Q/A" name="exportw" />
 </div>      
        
         <table id="search-table" width="98%">  
              <thead>
              
         <tr>      
     <!--     <th width="20%">Search By Customer Name:&nbsp;</th>
          <td><input type="text" style="width:200px;" name="{{$TABLE}}[bcust_name]" value="{{$detail.bcust_name}}" /></td>-->
          
         <!-- <th width="18%">Search By position:&nbsp;</th>
          <td><input type="text" style="width:180px;" name="{{$TABLE}}[p_name]" value="{{$detail.p_name}}" /></td>-->

          
  <!--        <th width="5%"><div align="center"><b>OR</b></div></th>
         
          <th align="center" width="5%">Sort:&nbsp;</th>
          <td><select name="{{$TABLE}}[qa_type]">
              <option value="All" {{if $detail.qa_type == "All"}} selected="selected" {{/if}}>--All--</option>
              <option value="ANSWERED" {{if $detail.qa_type == "ANSWERED"}} selected="selected" {{/if}}>ANSWERED</option>
              <option value="UNANSWERED" {{if $detail.qa_type == "UNANSWERED"}} selected="selected" {{/if}}>UNANSWERED</option>
            </select></td>
          <td> <input type="submit" name="search" value="Search" />
          <input type="submit" name="clear_search" value = "Clear Search" /></td>-->
         
      <!--  </tr>
      </thead>-->
    </form>
 <!-- </table>-->

  <table id="list-table" class="nav-back" width="98%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="3%">PQAID</th>
        <th class="topmenu" align="center" valign="middle" width="15%">Business Name</th>
       <!-- <th class="topmenu" align="center" valign="middle" width="10%">Customer Name</th>-->
        <th class="topmenu" align="center" valign="middle" width="5%">Total<br />Questions</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Position Appointed</th>
        <th class="topmenu" align="center" valign="middle" width="23%">Question</th>
         <th class="topmenu" align="center" valign="middle" width="7%">How Added</th>
        <th class="topmenu" align="center" valign="middle">Attachment For Question</th>
        <th class="topmenu" align="center" valign="middle" width="23%">Answer</th>
        <th class="topmenu" align="center" valign="middle">Attachment For Answer</th>
        <th class="topmenu" align="center" valign="middle" width="4%"><a href="{{$BASE_URL}}{{$XFA.list}}/orderby/{{$ord}}" title="{{$ord}}">Que. Date</a></th>
        <th class="topmenu" align="center" valign="middle" width="4%">Ans. Date</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Notes</th>
        <th class="topmenu" align="center" valign="middle">Add QA<br />to<br />Planning<br />Approval<br />Canberra</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Add Update<br /> Answer</th>
      </tr>
    </thead>
    
      {{if $list}}
    <tbody>
    
    {{foreach from=$list key="key" item="item"}}
    <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
      <td><div align="center"><!--{{counter assign=count}}{{assign var="iSum" value=$lastcount+$count}} {{$iSum}}--> {{$item.bqa_unique_id}}</div></td>
      <td><strong>{{$item.bcust_fname}} {{$item.bcust_lname}}</strong> <br />
      <a href="{{$BASE_URL}}business.detail/bsn_id/{{$item.bsn_id}}" target="_blank">{{$item.bsn_name}}</a></td>
     <!-- <td><a href="{{$BASE_URL}}customer.detail/bcust_id/{{$item.bcust_id}}" target="_blank">{{$item.bcust_fname}} &nbsp;{{$item.bcust_lname}}</a></td>-->
      <td>{{$item.total_ques}}</td>
      <td>{{$item.p_name}} <br /><strong>{{$item.p_email}}</strong></td>
      <td>{{$item.bqa_que|stripslashes}}</td>
      <td>{{if $item.bqa_from_pae eq 1 }}Through The Portal {{else}} Manually Added {{/if}}</td>
      <td data-ques-attachment>
				{{if $item.bqa_attachment_ques_1}}
				<div style="text-align:center;">
					<a href="/business.download_content?file_name={{$item.bqa_attachment_ques_1}}&module_name=business_qa.home"
						target="_blank">Attachment 1</a>
				</div>
				{{/if}}
				{{if $item.bqa_attachment_ques_2}}
				<div style="text-align:center;">
					<a href="/business.download_content?file_name={{$item.bqa_attachment_ques_2}}&module_name=business_qa.home"
						target="_blank">Attachment 2</a>
				</div>
				{{/if}}
				{{if $item.bqa_attachment_ques_3}}
				<div style="text-align:center;">
					<a href="/business.download_content?file_name={{$item.bqa_attachment_ques_3}}&module_name=business_qa.home"
						target="_blank">Attachment 3</a>
				</div>
				{{/if}}
				{{if $item.bqa_attachment_ques_4}}
				<div style="text-align:center;">
					<a href="/business.download_content?file_name={{$item.bqa_attachment_ques_4}}&module_name=business_qa.home"
						target="_blank">Attachment 4</a>
				</div>
				{{/if}}
				{{if $item.bqa_attachment_ques_5}}
				<div style="text-align:center;">
					<a href="/business.download_content?file_name={{$item.bqa_attachment_ques_5}}&module_name=business_qa.home"
						target="_blank">Attachment 5</a>
				</div>
				{{/if}}
			</td>      
      <td>{{$item.bqa_ans|stripslashes}}</td>
      <td data-answer-attachment>
				{{if $item.bqa_attachment_ans_1}}
				<div style="text-align:center;">
					<a href="/business.download_content?file_name={{$item.bqa_attachment_ans_1}}&module_name=business_qa.home"
						target="_blank">Attachment 1</a>
				</div>
				{{/if}}
				{{if $item.bqa_attachment_ans_2}}
				<div style="text-align:center;">
					<a href="/business.download_content?file_name={{$item.bqa_attachment_ans_2}}&module_name=business_qa.home"
						target="_blank">Attachment 2</a>
				</div>
				{{/if}}
				{{if $item.bqa_attachment_ans_3}}
				<div style="text-align:center;">
					<a href="/business.download_content?file_name={{$item.bqa_attachment_ans_3}}&module_name=business_qa.home"
						target="_blank">Attachment 3</a>
				</div>
				{{/if}}
				{{if $item.bqa_attachment_ans_4}}
				<div style="text-align:center;">
					<a href="/business.download_content?file_name={{$item.bqa_attachment_ans_4}}&module_name=business_qa.home"
						target="_blank">Attachment 4</a>
				</div>
				{{/if}}
				{{if $item.bqa_attachment_ans_5}}
				<div style="text-align:center;">
					<a href="/business.download_content?file_name={{$item.bqa_attachment_ans_5}}&module_name=business_qa.home"
						target="_blank">Attachment 5</a>
				</div>
				{{/if}}
			</td>
      <td>{{if $item.bqa_created_date !== '0000-00-00'}}{{$item.bqa_created_date|date_format:"%d-%m-%Y"}}{{/if}}</td>
      <td> {{if $item.bqa_ans_plain eq ''}}    {{else}} {{$item.bqa_ans_date|date_format:"%d-%m-%Y"}}{{/if}} </td>
      <td> {{$item.bqa_notes}} </td>
      <td data-toggle-planning>
        <label class="switch" for="show_in_planning_approval{{ $item.bqa_id }}">
          <input id="show_in_planning_approval{{ $item.bqa_id }}" class="switch-input" {{ if $item.show_in_planning_approval == 1 }}checked{{ /if }} onchange="planningApprovalToggle('{{ $item.bqa_id }}', 'show_in_planning_approval', this)" type="checkbox" />
          <span class="switch-label" data-on="Yes" data-off="No"></span>
          <span class="switch-handle"></span> <br />
        </label>
      </td>
      <td style="text-align:center"> <a href="{{$BASE_URL}}businessqa.detail/bqa_id/{{$item.bqa_id}}" class="various" title="Edit Add Answer">
        <img  src="{{$BASE_URL}}css/admin/images/edit.png"/></a></td>

    </tr>
    
    {{/foreach}}
    </tbody>
    
  </table>
  {{/if }}   
  {{if $last > 1}}
  <table width="90%" border="0" cellpadding="0" cellspacing="0">
    <tr> {{if $list}}
      <td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'><< previous</span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous"><<previous </a> {{/if}}
          
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
          {{if $pagenum == $last}} <span class='disabled'>next >></span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next >></a></div>
        {{/if}} </td>
      {{else}}
      <td align="center" height="300">Record Not found... </td>
      {{/if}} </tr>
  </table>
  {{/if}} </div>
  <script>
    function planningApprovalToggle(record_id, c, t) {
      console.log(record_id, c, t);
      let activeStatus = 0;
      if ($(t).is(":checked")) {
          activeStatus = 1;
      }
      const formData = {
          r_ID: record_id,
          column: c,
          flag: activeStatus,
          action: "planningApprovalToggle"
      };
      console.log(formData);
      $.ajax({
          type: "POST",
          url: "{{$BASE_URL}}businessqa.ajax_handler",
          data: formData,
          dataType: "json",
          encode: true,
          success: function (data) {
              if (data.success == true) {
                  // alert('You have successfully updated the record');
              }
              else {
                  alert('Some problem in updating the record');
              }
          }
      })
  }
  </script>
