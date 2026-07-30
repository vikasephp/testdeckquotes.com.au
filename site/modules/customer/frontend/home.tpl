<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<base href="{{$BASE_URL}}" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<title>.:: {{$SITE_NAME}} - {{$title}} ::.</title>
</head>
<body bgcolor="#63C1DB">
<div id="divInfoToReturn">
{{foreach from=$detail key="key" item="item"}}
<a href="javascript:setvalue({{$item.bsn_id}},'{{$item.bsn_name}}')">{{$item.bsn_name}}</a><br />
{{/foreach}}     
 <a href="javascript:closediv()" class="close_span">[&#88;]</a>
</div>
</body>