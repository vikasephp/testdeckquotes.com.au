<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/mainstyle.css" />

<table border="0"  cellpadding="5" class ="view-table" align="center">
    <tr> <td> <h2> Questions </h2> </td> <td> <h2> Answers </h2> </td> </tr>
      {{foreach from=$show key="key" item="item" }}
	{{if $item.res_column_value }}
		<tr height="40" > <td height="40"> {{$item.res_column_name}} </td> <td style="color:#333333;"> {{if $item.res_column_name=='StartDate' || $item.res_column_name=='EndDate' }} {{$item.res_column_value|date_format:"%e %B, %Y"}}  {{else}} {{$item.res_column_value}} {{/if}}</td> 
    {{/if}}    
{{/foreach}}

</table>

</div>