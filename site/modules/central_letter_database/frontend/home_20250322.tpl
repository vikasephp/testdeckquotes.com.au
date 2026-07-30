<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}
<script>
    !window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<script>

    function open_popup(type) {
        let viewurl = '';
        if (type == 'add_new') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.add_new_cld" + "/random/" + Math.random();
        }
        if (type == 'letter_type') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_letter_type" + "/random/" + Math.random();
        }
        else if (type == 'manage_status') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.status.view_fle_name }}" + "/random/" + Math.random();
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
</script>
<h3 class="page-title">{{$title}}</h3>
<br />
<form name="mlist" method="post" enctype="multipart/form-data">
    <div style="float:left; text-align:left;">
        &nbsp; &nbsp;
        <input type="button" name="add_new" value="Add New" onclick="javascript:open_popup('add_new');" />
        <input type="button" name="letter_type" value="Letter Type" onclick="javascript:open_popup('letter_type');" />
        <input type="button" name="status" value="Status" onclick="javascript:open_popup('manage_status');" />
    </div>
    <div style="float:right; text-align:right;">
        <!-- <input type="submit" name="reset" title="Reset" value="Reset">
        <input type="submit" value="Show Hidden" name="show_hidden" /> -->
    </div>
</form>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                <th class="topmenu" align="center" valign="middle" data-col="letter_id">Letter ID</th>
                <th class="topmenu" align="center" valign="middle" data-col="project_name">Project Name</th>
                <th class="topmenu" align="center" valign="middle" data-col="customer_name">Customer Name</th>
                <th class="topmenu" align="center" valign="middle" data-col="letter_type">Letter Type</th>
                <th class="topmenu" align="center" valign="middle" data-col="date_uploaded">Date Uploaded</th>
                <th class="topmenu" align="center" valign="middle" data-col="uploaded_by">Uploaded By</th>
                <th class="topmenu" align="center" valign="middle" data-col="status">Status</th>
                <th class="topmenu" align="center" valign="middle" data-col="uploaded_file">Uploaded File</th>
                <th class="topmenu" align="center" valign="middle" data-col="action">Action</th>
            </tr>
        </thead>
        <tbody>
            {{ if $list }}
            {{ foreach from=$list key="key" item="item" }}
            <tr bgcolor="{{ cycle values=" #D3E8D6,WHITE" advance=true }}">
                <td data-col="letter_id">{{ counter }}</td>
                <td data-col="project_name">
                    {{ if $item.cld_project_name }}
                        <a href="{{$BASE_URL}}business.detail/bsn_id/{{$item.cld_bsn_id}}">
                            {{ $item.cld_project_name }}
                        </a>
                    {{ /if  }}
                </td>
                <td data-col="customer_name">
                    {{ if $clientArr and $item.cld_bsn_id }}
                        {{ $clientArr[$item.cld_bsn_id] }}
                    {{ /if }}
                </td>
                <td data-col="letter_type">{{$item.cld_letter_type}}</td>
                <td data-col="date_uploaded">
                    {{ if $item.cld_file_name }}
                        {{$item.cld_date_uploaded|date_format:"%d/%m/%Y" }}
                    {{ /if }}
                </td>
                <td data-col="uploaded_by">
                    {{ if $item.cld_file_name }}
                        {{ $userArr[$item.cld_file_uploaded_by] }}
                    {{ /if }}
                </td>
                <td data-col="status">{{$item.cld_status}}</td>
                <td data-col="uploaded_file">
                    {{ if $item.cld_file_name }}
                    <a href="/{{ $BASEFOLDER }}.download_content?file_name={{$item.cld_file_name}}&module_name={{ $BASEFOLDER }}.home" target="_blank">Link</a>
                    {{ /if }}
                </td>
                <td data-col="action">
                    <a class="various" href="{{$BASE_URL}}{{$BASEFOLDER}}.edit/cld_id/{{$item.cld_id}}">
                        <img style="height: 20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png">
                    </a>
                </td>
            </tr>
            {{ /foreach }}
            {{ else }}
            <tr bgcolor="WHITE">
                <td colspan="9" style="text-align: center;">No Data Available</td>
            </tr>
            {{/if}}
        </tbody>
    </table>
    {{if $last > 1}}
    <table width="90%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            {{if $list}}
            <td align="center">
                <div class='pagination'>
                    {{if $pagenum == 1}}
                    <span class='disabled'>&#171; previous</span>
                    {{else}}
                        <a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation=" x - y"
                            x=$pagenum y=1}}" title="Previous">&#171; previous</a>
                        {{/if}}
                        {{if $pagenum != 1}}
                        <span class="paginate"><a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/1"
                                title="{{$page_num}} Page">1</a></span>
                        {{else}}<span class='current'>1</span>
                            {{/if}}{{if $pagenum != 2}}
                            <span class="paginate"><a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/2"
                                    title="{{$page_num}} Page">2</a></span>
                            {{else}}<span class='current'>2</span>
                                {{/if}}
                                {{if $paginateprev.0 > 3}}
                                ...
                                {{/if}}
                                {{foreach from=$paginateprev key="page_key" item="page_num"}}
                                {{if $page_num == $pagenum OR $page_num <= 2}}
                                {{elseif $page_num == $lastone}}
                                {{else}} <span class="paginate"><a class="pagination"
                                            href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num}}"
                                            title="{{$page_num}} Page">{{$page_num}}</a></span>
                                    {{/if}}
                                    {{/foreach}}
                                    {{foreach from=$paginatenext key="page_key" item="page_num2"}}
                                    {{if $page_num2 < $last AND $page_num2 != $lastone}}
                                    {{if $page_num2 == 1}}
                                    {{elseif $page_num2 == 2}}
                                    {{else}}
                                        {{if $page_num2 == $pagenum OR $page_num2 <= 0}}
                                        <span class='current'> {{$page_num2}}</span>
                                        {{else}}
                                            <a class="pagination"
                                                href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num2}}"
                                                title="{{$page_num2}} Page">{{$page_num2}}</a>
                                            {{/if}}
                                            {{/if}}
                                            {{/if}}
                                            {{/foreach}}
                                            {{if $page_num2 < $lasttow}}
                                            ...
                                            {{/if}}
                                            {{if $lastone == 1}}
                                            {{elseif $lastone == 2}}
                                            {{else}}
                                                {{if $pagenum == $lastone }}
                                                <span class='current'>{{$lastone}}</span>
                                                {{else}}
                                                    <a class="pagination"
                                                        href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$lastone}}"
                                                        title="{{$lastone}} Page">{{$lastone}}</a>
                                                    {{/if}}
                                                    {{/if}}
                                                    {{if $last == 1}}
                                                    {{elseif $last == 2}}
                                                    {{else}}
                                                        {{if $pagenum == $last}}
                                                        <span class='current'>{{$last}}</span>
                                                        {{else}}
                                                            <a class="pagination"
                                                                href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$last}}"
                                                                title="{{$last}} Page">{{$last}}</a>
                                                            {{/if}}
                                                            {{/if}}
                                                            {{if $pagenum == $last}}
                                                            <span class='disabled'>next &#187;</span>
                                                            {{else}}
                                                                <a class="pagination"
                                                                    href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="
                                                                    x + y" x=$pagenum y=1}}" title="Next">next
                                                                    &#187;</a>
                </div>
                {{/if}}
            </td>
            {{else}}
                <td align="center" height="300">Record Not found... </td>
                {{/if}}
        </tr>
    </table>
    {{/if}}
</div>
