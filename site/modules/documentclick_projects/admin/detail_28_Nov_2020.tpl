<h3 class="page-title">{{$title}}</h3>
<div>

<form name="detail" method="post" action="{{$XFA.detail}}">

<input type="submit" name="updateselect" value="Save" class="vsml" />
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
               		<th class="topmenu" align="center" valign="middle" width="10%">Bsn Id</th>    
            		<th class="topmenu" align="center" valign="middle" width="70%">Name of the Project</th> 
                    	<th class="topmenu" align="center" valign="middle" width="20%">Select / Unselect</th> 
               		 
            </tr>
        </thead>
       
        <tbody>
        {{foreach from=$list key="key" item="item"}}
            <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
             <td>{{$item.bsn_id}}</td>
                <td>{{$item.bsn_name}}</td>
             <!--    <input type="hidden" name="hide[{{$item.bsn_id}}]" value="0" />-->
                <td>
           
              
              <input type="checkbox" name="projects[{{$item.bsn_id}}]" {{if $item.bsn_show_documentclick eq 1 }} checked="checked" {{/if}}/>	            </td>
            </tr>
            
        {{/foreach}}
        </tbody>
    </table>
  </form>  
</div>
