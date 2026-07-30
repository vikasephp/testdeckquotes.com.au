<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/tree/simpletreemenu.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tree/simpletree.css" />

<h3 class="page-title">{{$title}}</h3>

<div style="float:left; width:100%;">

  <table id="list-table" width="99%">

    <thead>

      <tr>
        <th class="topmenu" align="center" valign="middle" width="5%">ID.</th>
        <th class="topmenu" align="center" valign="middle" width="15%">Person Name</th>
        <th class="topmenu" align="center" valign="middle" width="70%">Signature</th>
        <th class="topmenu" align="center" valign="middle" width="70%">From and Reply To</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Action</th>
      </tr>

    {{if $list}}

    <tbody>

    <form name="mlist" method="post">

      {{assign var=countn value= $numstartvounter}}

      {{foreach from=$list key="key" item="item"}}

      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">

        <td>{{$item.es_id}}</td>
	    <td>{{$item.es_name}}
		<td>{{$item.es_signature}}</td>
        <td>{{$item.es_reply_to}}</td>


        <td> <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" title="Edit">
        <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>
  
        <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete the listing? Because it will delete all the document related to this listing.')) return false;" title="Delete">
        <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>

        </td>

      </tr>

      {{assign var=countn value=$countn+1}}

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

  <table id="doclist-table"  width="100%" bgcolor="#d3e8d6">

    <thead>

      <tr>
        <th class="topmenu" valign="middle" ><div align="left"></div></th>
      </tr>

    
    </thead>

  </table>

</div>