
<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="5%">Stage Number</th> 
                   <th class="topmenu" align="center" valign="middle" width="50%">Stage Name</th>  
                   <th class="topmenu" align="center" valign="middle" width="15%">Add Task</th> 
          	      
            </tr>
        </thead>
    <tbody>

 {{foreach from=$stageData key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

        <td>{{$item.st_number}}</td>
        <td>{{$item.st_option}}</td>
        <td><a href="{{$BASE_URL}}property_sale_project_tracker.view_task/st_id/{{$item.st_id}}" class="various">Add Task</a></td>
      </tr>  
  {{/foreach}}
  </tbody>
  </table>
