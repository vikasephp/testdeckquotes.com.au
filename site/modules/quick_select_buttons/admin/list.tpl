<script>
 function submit_form() { document.send_form.submit(); }
</script>

<h3 class="page-title">{{$title}}</h3>
<div id="">
  <div align="left">
    <div style="font-weight:bold; color:#FF6600;">{{$msg}}</div>
  </div>
    <form action="" name="search" method="post">
  <table id="list-table" class="nav-back" width="100%">
  
   <input type="hidden" name="bid" value="{{$bid}}"  />
   <input type="submit" name="save_cpi" value="Save Selected" />
    <thead>

    <tr bgcolor="#FFFFFF"><th colspan="2">Select Button</th>
        <td colspan="6">
        <select name="data[mr_id]" onchange="submit();" >
            <option value="0">-- Select --</option>
            
           {{foreach from = $buttons item=item key=key}}
           <option value="{{$item.mr_id}}" {{if $item.mr_id eq $bid}} selected="selected" {{/if}}>{{$item.mr_button_name}}</option>
          {{/foreach}}
        </select>
        </td>
       </tr>
      <tr>
       <th class="topmenu" align="center" valign="middle" width="4%">Sr. No.</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Unique Id</th>
        <th class="topmenu" align="center" valign="middle" width="40%">Name</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Action</th>
      </tr>
    </thead>
  
    <tbody>
    {{if $bid gt 0 }}
    {{foreach from=$doc item="item" key="key"}}
    <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
    <td>{{counter}}</td>
      <td>{{$item.admin_doc_id}}</td>
      <td>{{$item.admin_doc_name}}</td>

	    <input type="hidden" name="doc2[{{$item.admin_doc_id}}]" value="0"  />	
      <td><input type="checkbox" name = "doc2[{{$item.admin_doc_id}}]" {{if $item.$button eq 1}} checked="checked" {{/if}} />
      </td>
    </tr>
    {{/foreach}}
    
    {{/if}}
    </tbody>
    
  </table>
   </form> 
</div>