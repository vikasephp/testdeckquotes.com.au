<h3 class="h2_header">{{$soe_data.soe_name|default:"Search"}} - Leads</h3>
<br />
{{if $list}}
<table cellpadding="3" cellspacing="3" width="98%" id="lead-table" >
  <tr bgcolor="#4aaac3">
    <th width="5%">No</th>
    <th width="25%">Project Name</th>
    <th width="20%">Customer</th>
    <th width="10%">Created Date</th>
    <th width="5%">Status</th>
    <th width="10%">Initial Phone Call</th>
    <th width="10%">Email Advice</th>
    <!--<th>Answer Required</th>-->
    <th width="8%">Action</th>
  </tr>
  {{foreach from=$list key="key" item="item"}}
  <tr>
    <td>{{counter}}</td>
    <td>{{$item.bsn_name}}</td>
    <td>{{$item.bcust_fname}} {{$item.bcust_lname}}</td>
    <td>{{$item.be_created_date|date_format:'%d-%m-%Y'}}</td>
    <td>{{if $item.be_status == 1}}Active{{else}}Inactive{{/if}}</td>
    <td>{{if $item.be_ipc_date !== '0000-00-00'}}{{$item.be_ipc_date|date_format:'%d-%m-%Y'}}{{/if}}</td>
    <td>{{if $item.be_easts_date !== '0000-00-00'}}{{$item.be_easts_date|date_format:'%d-%m-%Y'}}{{/if}}</td>
    <!--  <td><input type="checkbox" {{if $item.be_answer_required == 1}} checked="checked" {{/if}} disabled="disabled"/></td>-->
    <th><div align="left" style="width:100%;"> <a href="{{$BASE_URL}}js/vcard/index.php?fname={{$item.bcust_fname}}&lname={{$item.bcust_lname}}&email1={{$item.bcust_misc_email1}}&email2={{$item.bcust_misc_email2}}&mobile={{$item.bcust_misc_moble}}&business={{$item.bcust_misc_business}}&home={{$item.bcust_misc_home}}" class="action_new" title="Download Vcard"><img style="height: 17px; width:22px" src="{{$BASE_URL}}images/vcard.png"/></a> &nbsp; <a href="{{$BASE_URL}}business.detail/bsn_id/{{$item.bsn_id}}#{{$item.be_id}}" title="Edit" target="_blank"> <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a> </div></th>
  </tr>
  {{/foreach}}
</table>
</div>
{{if $last > 1}}
<table width="90%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>&laquo; previous</span> {{else}} <a class="paginationnew" rel="id/{{$soe_data.soe_id}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous">&laquo; previous</a> {{/if}}
        
        {{if $pagenum != 1}} <span class="paginate"><a class="paginationnew" rel="id/{{$soe_data.soe_id}}/pagenum/1"   title="{{$page_num}} Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a class="paginationnew" rel="id/{{$soe_data.soe_id}}/pagenum/2"   title="{{$page_num}} Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
        {{if $paginateprev.0 > 3}}
        ...
        {{/if}}
        {{foreach from=$paginateprev key="page_key" item="page_num"}}
        {{if $page_num == $pagenum OR $page_num <= 2}}
        {{elseif $page_num == $lastone}}
        
        {{else}} <span class="paginate"><a class="paginationnew" rel="id/{{$soe_data.soe_id}}/pagenum/{{$page_num}}" title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
        {{/foreach}}
        
        {{foreach from=$paginatenext key="page_key" item="page_num2"}}
        {{if $page_num2 < $last AND $page_num2 != $lastone}}
        {{if $page_num2 == 1}}
        {{elseif $page_num2 == 2}}
        {{else}}
        {{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'> {{$page_num2}}</span> {{else}} <a class="paginationnew" rel="id/{{$soe_data.soe_id}}/pagenum/{{$page_num2}}" title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
        {{/if}}     
        {{/if}}
        {{/foreach}}
        {{if $page_num2 < $lasttow}}
        ...
        {{/if}}
        {{if $lastone == 1}}
        {{elseif $lastone == 2}}
        {{else}}
        {{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span> {{else}} <a class="paginationnew" rel="id/{{$soe_data.soe_id}}/pagenum/{{$lastone}}" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
        {{/if}}
        {{if $last == 1}}
        {{elseif $last == 2}}
        {{else}}
        {{if $pagenum == $last}} <span class='current'>{{$last}}</span> {{else}} <a class="paginationnew" rel="id/{{$soe_data.soe_id}}/pagenum/{{$last}}" title="{{$last}} Page">{{$last}}</a> {{/if}}
        {{/if}}
        {{if $pagenum == $last}} <span class='disabled'>next &raquo;</span> {{else}} <a class="paginationnew" rel="id/{{$soe_data.soe_id}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next &raquo;</a></div>
      {{/if}} </td>
  </tr>
</table>
{{/if}}
{{else}}
<div align="center" height="300" style="vertical-align:middle;">Record Not found... </div>
{{/if}}
<script type="text/javascript">
$('.paginationnew').click(function(){
  var page = $(this).attr('rel');
$("#container").html('<img src="{{$BASE_URL}}images/loading-animation.gif"/>');
$('#container').load(URL+'/getleads/'+page, function() {
});
});
</script>
