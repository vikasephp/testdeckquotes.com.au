<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/tree/simpletreemenu.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tree/simpletree.css" />
<script>
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
				'width': '58%',
				'height': '75%',
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
</script>
<h3 class="page-title">{{$title}}</h3>
<form name="mlist" method="post" action="">
  <input type="hidden" name="reportgen" value="reportgen" />
  <table  width="100%">
    <tr>
      <td><div align="center" style="float:left; width:600px; color: #990000;">{{if $message}}
          <div align="center">{{$message}}</div>
          {{/if}}</div>
        <div style="float:right;">
          <select name="report_type" >
            <option value="1">24 Hour</option>
            <option value="2">7 Day's</option>
          </select>
          &nbsp;&nbsp;
          <input type="submit" name="Generate-Report" value="Generate Report" />
        </div></td>
    </tr>
  </table>
</form>
<div style="float:left; width:100%;">
  <table id="list-table" class="nav-back" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="2%">No.</th>
        <th class="topmenu" align="center" valign="middle" width="20%">User Name</th>
        <th class="topmenu" align="center" valign="middle" width="35%">Report Name</th>
        <th class="topmenu" align="center" valign="middle" width="15%"><a href="{{$BASE_URL}}{{$XFA.list}}/field_name/ur_type/ord/{{$ord}}" title="{{$ord}}">Report Type</a></th>
        <th class="topmenu" align="center" valign="middle" width="20%"><a href="{{$BASE_URL}}{{$XFA.list}}/field_name/ur_timestamp/ord/{{$ord}}" title="{{$ord}}">Report Date</a></th>
        <th class="topmenu" align="center" valign="middle" width="8%">Action</th>
      </tr>
    {{if $list}}
    <tbody>
    
    {{foreach from=$list key="key" item="item"}}
    <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
      <td>{{counter}}.</td>
      <td>{{$item.user_name}}</td>
      <td>{{$item.ur_report_name}}</td>
      <td>{{foreach from=$report_types key="tid" item="typename"}}{{if $item.ur_type == $tid}}{{$typename}}{{/if}}{{/foreach}}</td>
      <td>{{$item.ur_timestamp|date_format:"%d-%m-%Y %H:%M:%S"}}</td>
      <td><a href="{{$BASE_URL}}{{$FILE_PATH}}files/user_reports/{{$item.ur_report_name}}" class="various" title="View"><img style="height: 25px;; width:25px" src="{{$BASE_URL}}css/admin/images/view.png"/></a> &nbsp;<a href="{{$BASE_URL}}{{$FILE_PATH}}files/user_reports/{{$item.ur_report_name}}" title="Download" target="_blank"><img style="height: 25px;; width:25px" src="{{$BASE_URL}}css/admin/images/download.png"/></a> </td>
    </tr>
    {{/foreach}}
    </tbody>
    </form>  
    {{/if}}
  </table>
  {{if $last > 1}}
  <table width="90%" border="0" cellpadding="0" cellspacing="0">
    <tr> {{if $list}}
      <td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>« previous</span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous">« previous</a> {{/if}}
          
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
  {{/if}} <br />
  <br />
</div>
