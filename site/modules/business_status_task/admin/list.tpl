<script> function submit_form() { document.send_form.submit(); } </script>
<script> function submit_form2() { document.send_form2.submit(); } </script>

<script>
    !window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />


<h3 class="page-title">{{$title}}</h3>

<script>

    function add_procedure() {
        var viewurl = "{{$BASE_URL}}business_status_taskAdmin.view_procedure" + "/random/" + Math.random();

        $(document).ready(function () {

            $.fancybox({

                'width': '90%',
                'height': '99%',
                'autoScale': false,
                'transitionIn': 'elastic',
                'transitionOut': 'elastic',
                'speedIn': 300,
                'speedOut': 300,
                'overlayShow': true,
                'overlayColor': '#000',
                'hideOnOverlayClick': false,
                'hideOnContentClick': false,
                'type': 'iframe',
                'href': viewurl,
                'scrolling': 'yes'
            });
        });
    }
    function close_win() {
        $.fancybox.close();
        window.location.reload();
    }
</script>


<div id="">
    <div align="left" style="text-align:left;">
        <input type="button" name="proce" value="Procedure Panel" onclick="javascript:add_procedure();" />

        <div style="font-weight:bold; color:#FF6600;">{{$msg}}</div>
        <form action="{{$BASE_URL}}{{$XFA.list}}" method="post" name="send_form">
            <select name="cbs" onchange="javascript:submit_form();">
                {{foreach from=$allbusiness_status item=item key=key}}
                <option value="{{$item.st_id}}" {{if $cbs_id==$item.st_id}} selected="selected" {{/if}}>
                    {{$item.st_name}}</option>
                {{/foreach}}
            </select>
        </form>
    </div>


    <div align="right">
        <form action="{{$BASE_URL}}{{$XFA.list}}" method="post" name="send_form2">
            Select Position Responsible
            <select name="pos" onchange="javascript:submit_form2();">
                <option value="0">-- Select All --</option>
                {{foreach from=$positions item=item2 key=key2}}
                <option value="{{$item2.p_id}}" {{if $pos_id==$item2.p_id}} selected="selected" {{/if}}>
                    {{$item2.p_name}}</option>
                {{/foreach}}
            </select>
        </form>
    </div>

    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                <th class="topmenu_list" align="center" valign="middle" width="15%">
                    <div align="center">Action</div>
                </th>
                <th class="topmenu_list" valign="middle" width="5%">
                    <div align="center">Status</div>
                </th>
                <th class="topmenu_list" align="center" valign="middle" width="25%">
                    <div align="center">Task Name</div>
                </th>
                <th class="topmenu_list" align="center" valign="middle" width="8%">
                    <div align="center">Task UID</div>
                </th>
                <th class="topmenu_list" align="center" valign="middle" width="35%">
                    <div align="center">What Text</div>
                </th>
                <th class="topmenu_list" align="center" valign="middle" width="5%">
                    <div align="center">Planning<br>Order</div>
                </th>
                <th class="topmenu_list" align="center" valign="middle" width="8%">
                    <div align="center">Required Documents</div>
                </th>
                <th class="topmenu_list" align="center" valign="middle" width="21%">
                    <div align="center">Project Type</div>
                </th>
                <th class="topmenu_list" align="center" valign="middle" width="11%">
                    <div align="center">Required Data Field</div>
                </th>
                <th class="topmenu_list" align="center" valign="middle" width="11%">
                    <div align="center">Authorization Area</div>
                </th>
                <th class="topmenu_list" align="center" valign="middle" width="11%">
                    <div align="center">Responsible Position</div>
                </th>
                <th class="topmenu_list" align="center" valign="middle" width="5%">
                    <div align="center">Seq</div>
                </th>
            </tr>
        </thead>
        <tbody>
            {{foreach from=$task item="item" key="key"}}
            <tr bgcolor="{{cycle values=" #D3E8D6,WHITE" advance=true}}">
                <td><a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.bst_id}}" title="Edit"><img
                            style="height: 20px;; width:20px"
                            src="{{$BASE_URL}}css/admin/images/edit.png" /></a>&nbsp;&nbsp;<a
                        href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.bst_id}}" title="Delete"
                        onclick="javascript:if(!confirm('Are you sure you want to delete the Task?')) return false;"><img
                            style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png" /></a>
                    &nbsp;<a href="{{$BASE_URL}}{{$XFA.list}}/cbs/{{$cbs_id}}/up/{{$item.bst_order}}"
                        title="Move Up"><img style="height: 20px;; width:20px"
                            src="{{$BASE_URL}}css/admin/images/arrowup.png" /></a>
                    &nbsp;<a href="{{$BASE_URL}}{{$XFA.list}}/cbs/{{$cbs_id}}/down/{{$item.bst_order}}"
                        title="Move Down"><img style="height: 20px;; width:20px"
                            src="{{$BASE_URL}}css/admin/images/arrowdown.png" /></a>
                </td>
                <td>{{$item.st_name}}</td>
                <td>{{$item.bst_task_name}}</td>
                <td>{{ if $item.bst_task_id != 0 }}{{$item.bst_task_id}}
                    {{else}}{{$item.bst_id}}{{/if}}
                </td>
                <td>{{ $item.bst_what_text }}</td>
                <td>{{ $item.bst_planning_order }}</td>
                <td>{{if !empty($item.bst_document)}}<a
                        href="{{$BASE_URL}}{{$FILE_PATH}}files/task_files/{{$item.bst_document}}" target="_blank">View
                        Document</a>{{/if}}</td>
                <td>
                    <ul style="font-size:11px;">
                        {{foreach from=$item.bst_business_types item="item1" key="key1"}}
                        {{foreach from=$busness_types item="item2" key="key2"}}
                        {{if $key1 == $item2.pt_id && $item1 == 1}}
                        <li>&nbsp;>>&nbsp;{{$item2.pt_name}}</li> {{/if}}
                        {{/foreach}}
                        {{/foreach}}
                    </ul>
                </td>
                <td>{{$item.df_name}}</td>
                <td>{{$item.autha_name}}</td>
                <td>
                    <ul style="font-size:11px;">
                        <li>{{$item.p_name}}</li>
                    </ul>
                </td>
                <td>{{$item.bst_order}}</td>
            </tr>
            {{/foreach}}
        </tbody>
    </table>
</div>