<div id="" style="clear:both;">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="5%">SrNo.</th>
                   <th class="topmenu" align="center" valign="middle" width="6%">QA</th>
                   <th class="topmenu" align="center" valign="middle" width="32%">Project Address</th>
                   <th class="topmenu" align="center" valign="middle" width="8%">Location</th>
                   <th class="topmenu" align="center" valign="middle" width="12%">Hidden from</th>
                   <th class="topmenu" align="center" valign="middle" width="28%">Restore to stage</th>
				   <th class="topmenu" align="center" valign="middle" width="9%">Action</th>
            </tr>
        </thead>
    <tbody>
 {{if $list}}
 {{foreach from=$list key="key" item="item"}}
    <tr bgcolor="#FFFFFF">
        <td>{{counter}}</td>
        <td {{if $item.cse_qa eq 0}} style="background:#00CC33;" {{else}} style="background:#F00;" {{/if}}>
			{{if $item.cse_qa eq 0}}Yes{{else}}No{{/if}}
			{{if $item.cse_qa_user}}<br />{{$item.cse_qa_user}}<br />{{$item.cse_qa_date}}{{/if}}
        </td>
        <td><a href="{{$item.link}}" target="_blank">{{$item.cse_project}}</a></td>
        <td>{{$item.cse_location}}</td>
        <td>
			{{if $item.cse_stage eq 1}}Floor System
			{{elseif $item.cse_stage eq 2}}Pre Sheet
			{{elseif $item.cse_stage eq 3}}Final
			{{elseif $item.cse_stage eq 4}}Completed
			{{else}}—{{/if}}
        </td>
        <td>
			<form method="post" action="{{$BASE_URL}}{{$XFA.home}}" style="margin:0;">
				<input type="hidden" name="restore_cse_id" value="{{$item.cse_id}}" />
				<select name="restore_stage" style="width:140px;">
					<option value="1" {{if $item.cse_stage eq 1}}selected="selected"{{/if}}>Floor System</option>
					<option value="2" {{if $item.cse_stage eq 2}}selected="selected"{{/if}}>Pre Sheet</option>
					<option value="3" {{if $item.cse_stage eq 3}}selected="selected"{{/if}}>Final</option>
				</select>
				<input type="submit" name="restore_hidden" value="Restore" onclick="return confirm('Restore this project to the selected stage? QA and inspection data will be kept.');" />
			</form>
        </td>
        <td>
			<a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit">
				<img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/>
			</a>
        </td>
    </tr>
 {{/foreach}}
 {{else}}
    <tr bgcolor="#FFFFFF"><td colspan="7" align="center" height="80">No hidden projects.</td></tr>
 {{/if}}
  </tbody>
  </table>
</div>
