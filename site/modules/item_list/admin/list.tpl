<script> function submit_form() { document.send_form.submit(); } </script>
<script> function submit_form2() { document.send_form2.submit(); } </script>

<script>
    !window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />


<h3 class="page-title">{{$title}}</h3>

<script>
    function open_popup(type, viewurl = '') {
        if (type == 'manage_procedure') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_procedure" + "/random/" + Math.random();
        }
        else if (type == 'add_new') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.detail" + "/random/" + Math.random();
        }
        else if (type == 'category') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_category" + "/random/" + Math.random();
        }
        
        $(document).ready(function () {
            $.fancybox({
                'width': '90%',
                'height': '99%',
                'autoScale': false,
                'transitionIn': 'elastic',
                'transitionOut': 'elastic',
                'speedIn': 400,
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
    <div style="display: flex; justify-content: space-between; align-items: end;">
        <div class="left-side">
            <input type="button" name="letter_type" value="Categories" onclick="javascript:open_popup('category');" style="margin-left: 0;" />
        </div>
        <div class="right-side" style="text-align: right;">
            <input type="button" name="add_new" value="Add New" onclick="javascript:open_popup('add_new');" />
        </div>
    </div>
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                <th class="topmenu_list" align="center" valign="middle">
                    <div align="center">Action</div>
                </th>
                <th class="topmenu_list" align="center" valign="middle">
                    <div align="center">Category</div>
                </th>
                <th class="topmenu_list" align="center" valign="middle">
                    <div align="center">Item</div>
                </th>
                <th class="topmenu_list" align="center" valign="middle">
                    <div align="center">Will It Come With a Manual</div>
                </th>
                <th class="topmenu_list" align="center" valign="middle">
                    <div align="center">For Inclusions</div>
                </th>
            </tr>
        </thead>
        <tbody>
            {{foreach from=$list item="item" key="key"}}
            <tr bgcolor="{{cycle values=" #D3E8D6,WHITE" advance=true}}">
                <td>
                    <a onclick="open_popup('', '{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}')" href="javascript:void(0);" title="Edit" class="various"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png" /></a>
                    <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" title="Delete" onclick="javascript:if(!confirm('Are you sure you want to delete the Task?')) return false;"><img style="height: 20px; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png" /></a>
                </td>
                <td>{{$item.ic_name}}</td>
                <td>{{$item.il_name}}</td>
                <td>{{$item.il_is_manual_available == 1 ? 'Yes' : 'No'}}</td>
                <td>{{$item.il_is_inclusions == 1 ? 'Yes' : 'No'}}</td>
            </tr>
            {{/foreach}}
        </tbody>
    </table>
</div>