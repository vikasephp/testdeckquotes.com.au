<body bgcolor="#63C1DB">
<div id="divInfosaleToReturn">
{{foreach from=$detail key="key" item="item"}}
<a href="javascript:setsalevalue({{$item.bsn_id}},'{{$item.bsn_name}}')">{{$item.bsn_name}}</a><br />
{{/foreach}}     
 <a href="javascript:closediv()" class="close_span">[&#88;]</a>
</div>
</body>