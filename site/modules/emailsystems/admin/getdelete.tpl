{{if $et_attachments}}
			<ul>
		{{foreach from=$et_attachments key="key" item="item"}}
	<li style="border:1px solid #c1dad7; padding:5px;">{{$item}}<div style="float:right;">
    <a href="javascript:delete_attachment('{{$key}}');" title="Delete"><img src="{{$BASE_URL}}css/admin/images/delete.png" /></a></div></li>

	{{/foreach}}
    </ul>
    {{else}}
    <div>No Attachment Found.</div>
    {{/if}}