{{include file=$jdata}}


<h3 class="page-title">{{$title}}</h3>
<table width="90%">
<tr>
<td  style="text-align:left;">
<input type="button" name="Add New" value="Add New Industry" onclick="javascript:add_new('{{$BASE_URL}}suppliers.add_industry');" />  &nbsp;
<input type="button" name="edit_cat" value="Edit Industry" onclick="javascript:add_new('{{$BASE_URL}}suppliers.edit_industry');" />
</td>


</table>
<br /><br />


<table  width="100%"><tr><td>

 <div style="float:left;">
 <form name="search" method="post" action="">
    <span>&nbsp;&nbsp;&nbsp;<strong>Industry:</strong>&nbsp;&nbsp;</span>
    
     <select name="keyword_1">
           {{foreach from=$inddata key="key" item="item"}}
         	<option value="{{$item.si_industry}}" >{{$item.si_industry}}</option>
           {{/foreach}}
     </select>	
    &nbsp;&nbsp;&nbsp
    <input type="submit" value="Search" name="search"  />
    
    <span>&nbsp;&nbsp;&nbsp;<strong>State:</strong>&nbsp;&nbsp;</span>
    
     <select name="keyword_2">
           {{foreach from=$state key="key" item="item"}}
         	<option value="{{$item.sp_state}}" >{{$item.sp_state}}</option>
           {{/foreach}}
     </select>	
    &nbsp;&nbsp;&nbsp
    <input type="submit" value="Search" name="search2"  />
    
    </form>
   </div> 
<div style="float:right;"> 
<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}suppliers.home/export/1'" /> &nbsp;
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" /> </div>
</td></tr></table>
<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
               	    <th class="topmenu" align="center" valign="middle" width="5%">Id</th>  
                    <th class="topmenu" align="center" valign="middle" width="10%">Industry</th>   
            	    <th class="topmenu" align="center" valign="middle" width="10%">Business Name</th>
                    <th class="topmenu" align="center" valign="middle" width="20%">Website</th> 
                    <th class="topmenu" align="center" valign="middle" width="15%">Address</th> 
                    <th class="topmenu" align="center" valign="middle" width="5%">State</th> 
                    <th class="topmenu" align="center" valign="middle" width="5%">Phone</th> 
                    <th class="topmenu" align="center" valign="middle" width="5%">Download<br />Excel</th>  
                    
                     <th class="topmenu" align="center" valign="middle" width="5%">When Updated</th>          
                    <th class="topmenu" align="center" valign="middle" width="5%">Action</th>   
            </tr>
        </thead>
        <tbody>
        {{foreach from=$list key="key" item="item"}}
            <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
             <td>{{counter}}</td>
                <td>{{$item.sp_industry}}</td>
                <td>{{$item.sp_business_name}}</td>
                <td>{{$item.sp_website}}</td>
                <td>{{$item.sp_address}}</td>
                <td>{{$item.sp_state}}</td>
                <td>{{$item.sp_phone}}</td>
                 <td>{{if $item.sp_upload_excel}} <a href="{{$BASE_URL}}files/suppliers/{{$item.sp_upload_excel}}">Download </a>{{/if}} </td>
                
                <td>{{$item.sp_when_updated|date_format:"%d-%m-%Y"}}</td>
                <td><a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"><img style="height: 20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;"><img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a></td>
            </tr>  
        {{/foreach}}
        </tbody>
    </table>
</div>