<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<table width="99%" id="viewbus-table" style="background-color:#FFFFFF;">
{{if $calclist}}
<tr> <th>Project Type</th> <th>Project SQM</th><th> Total </th><th>Action</th><th width="2%"> Select </th> </tr>
    {{foreach from=$calclist item="item" key="key"}}
	<tr><td> 
    
    {{foreach from=$Decking_types key="key1" item="item1"}}
    		{{if $item.bdc_ptype == $key1 }} {{$item1}}  {{/if}}
    {{/foreach}}
    
  </td><td >{{$item.bdc_ptsqm}}</td><td width="200">{{$item.bdc_subtotal}}</td><td>
<!--  <a href="javascript:edit_deckingjs({{$item.bdc_ptsqm}});" title="Edit"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;-->

  <a href="javascript:insertintojs({{$item.bdc_id}}, {{$item.bdc_subtotal}});" title="Insert Into Job Sheet">
  <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/insert.png"/></a>&nbsp;
  <a href="javascript:deletejs({{$item.bdc_id}});" onclick="javascript:if(!confirm('Are you sure you want to delete?')) return false;">
  <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;</td>
  <td> <input type="checkbox" name="insert[]" id="insert" value="{{$item.bdc_subtotal}}" class = "insert"  alt='{{foreach from=$Decking_types key="key1" item="item1"}}
    		{{if $item.bdc_ptype == $key1 }} {{$item1}}-{{$item.bdc_ptsqm|string_format:"%d"}} {{/if}}
    {{/foreach}}' /> </td>
  </tr>    
    {{/foreach}}
    <tr><td colspan="2"></td>
    <td> <input type="button" name="calsel" id="calsel" value="Add Selected" onclick="javascript:calselected();" />  </td>
    <td>Sum of Selected Project </td><td><input type="text" name="instojs" id="instojs"/></td></tr>
{{else}}    
<tr><td>Data Not Found.</td></tr>    
 {{/if}}   
</table>