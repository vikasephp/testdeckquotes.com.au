<body bgcolor="#63C1DB">
<div id="divCustomersInfo">
{{foreach from=$detail key="key" item="item"}}
<a href="javascript:setcustvalue({{$item.bcust_id}},'{{$item.bcust_fname}} {{$item.bcust_lname}}')">{{$item.bcust_fname}} {{$item.bcust_lname}}</a><br />
{{/foreach}}     
 <div align="right"><a href="javascript:closediv()" class="close_span">[&#88;]</a></div>
</div>

</body>