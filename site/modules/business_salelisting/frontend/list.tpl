<h3 class="page-title">{{$title}}</h3>
<div id="">
<table id="search-table" width="90%" >
<form name="search" action="{{$XFA.list}}" method="post">
 <thead>
 <tr>
 		<th align="center" valign="middle" width="15%">Business Name:&nbsp;</th>
		<td colspan="3"><input type="text" class="lrg" name="{{$TABLE}}[bsn_name]" value="{{$detail.bsn_name}}" size="80" /> </td>    
 </tr>
 <tr>
      	<th align="center" valign="middle" width="15%">Listed On:&nbsp;</th>
        <td><input type="text" class="lrg" name="{{$TABLE}}[bsn_cd_date_appraised_date]" value="{{$detail.bsn_cd_date_appraised_date}}"/> </td>    
        <th align="center" valign="middle" width="10%">Listed URL:&nbsp;</th>
        <td><input type="text" class="lrg" size="50" /> </td>
 </tr>
 <tr>
 	<th align="center" valign="middle" width="10%">Last Updatd From:&nbsp;</th>
    <td><input type="text" class="w16em dateformat-Y-ds-m-ds-d" id="demo13" maxlength="25" readonly="readonly"/></td>
    <th align="center" valign="middle" width="10%"> To:&nbsp;</th>
    <td><input type="text" class="w16em dateformat-Y-ds-m-ds-d" id="demo14" maxlength="25"  readonly="readonly"/></td>  
 </tr>
 <tr>
    <th> <input type="checkbox"  /> Show out of date listings </th> <td colspan="3"> </td>
 </tr>  
 <tr> 
 	<td colspan="4"><input type="submit" name="search" value="Search" />&nbsp;
  </tr>
  </thead>
</form>    
</table>
 
  