
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<h3 class="page-title">{{$title}}</h3>
<div>

 <form action="" name="search" method="post">

<div class="bsearch_scroll_div" style="float:left;">
            <ul style="margin: 0; padding: 0; text-align:left;">
               {{foreach from=$business_status key="key" item="item"}}
 <li><input  type="checkbox" name="status[]" value="{{$item.st_id}}" {{if $item.st_click_project eq 1}} checked="checked" {{/if}}  /> {{$item.st_name}}</li>
               {{/foreach}}
           </ul>
          
</div> 

<div style="float:left;">
<input type="submit" name="updatestatus" value="Update Status" style="background:#06C !important; height:40px;"  /> 
</div>
<br />
<div style="float:left; margin-top:5px;"> 
<input type="submit" name="showselected" value="Show Selected Projects"  />
<input type="submit" name="showall" value="Show All Projects"  />
</div>

<div style="float:right;">
<input type="submit" name="updateselect" value="Update Select/Unselect"  />
</div>

    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
               		<th class="topmenu" align="center" valign="middle" width="10%">Bsn Id</th>    
            		<th class="topmenu" align="center" valign="middle" width="70%">Name of the Project</th> 
                    	<th class="topmenu" align="center" valign="middle" width="20%">Select / Unselect</th> 
               		 
            </tr>
        </thead>
       
        <tbody>
        {{foreach from=$list key="key1" item="item1"}}
            <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
             <td>{{$item1.bsn_id}}</td>
                <td>{{$item1.bsn_name}}</td>
            
                <td>
           <!-- <input type="hidden" name="doc_click[{{$item.bsn_id}}]" value="0" />-->
<label class="switch">
<input class="switch-input" type="checkbox" name="doc_click[]" value="{{$item1.bsn_id}}" {{if $item1.bsn_show_documentclick eq 1}} checked="checked" {{/if}} />

<!--<input class="switch-input" type="checkbox" name="doc_click[{{$item1.bsn_id}}]" {{if $item1.bsn_show_documentclick eq 1}} checked="checked" {{/if}} />-->
<span class="switch-label" data-on="Yes" data-off="No"></span> 
<span class="switch-handle"></span> 
</label>  
              
              </td>
            </tr>
            
        {{/foreach}}
        </tbody>
    </table>
  </form>  
</div>
