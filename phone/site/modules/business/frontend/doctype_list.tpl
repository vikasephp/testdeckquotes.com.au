{{if $detail}}
<body bgcolor="#63C1DB">
<div id="divDoctypeInfo">
{{foreach from=$detail key="key" item="item"}}
<a href="javascript:setdactyevalue({{$item.dt_id}},'{{$item.dt_name}}')">{{$item.dt_name}}</a><br />
{{/foreach}}     
 <div align="right"><a href="javascript:closediv()" class="close_span">[&#88;]</a></div>
</div>
</body>
{{/if}}