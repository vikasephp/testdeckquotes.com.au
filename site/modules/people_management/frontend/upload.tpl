<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div style="padding:10px;">
{{if $files}}
<table cellpadding="0" cellspacing="0" id="EMP-list-table" width="100%" >
	{{foreach from = $files key="key" item="item"}}
	<tr><td width="40%">{{$item.ud_title}}</td><td width="50%"><a href="{{$BASE_URL}}files/user_docs/{{$item.ud_name}}" target="_blank">{{$item.ud_name}}</a></td><td>
    <a href="javascript:del({{$item.ud_id}});" title="Delete"><img src="{{$BASE_URL}}images/DeleteRed_new.gif" width="20" /></a></td></tr>
	{{/foreach}}
</table>
{{/if}}
</div>