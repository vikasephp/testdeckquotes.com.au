<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<script>
    !window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<script type="text/javascript">
    $(document).ready(function () {
        /*
        *   Examples - images
        */
        $(".various").fancybox({
            'width': '99%',
            'height': '95%',
            'autoScale': false,
            'transitionIn': 'elastic',
            'transitionOut': 'elastic',
            'speedIn': 300,
            'speedOut': 300,
            'overlayShow': true,
            'hideOnOverlayClick': false,
            'hideOnContentClick': false,
            'type': 'iframe',
            'scrolling': 'yes'
        });



    });

    function add_new() {
        var viewurl = "{{$BASE_URL}}recruitment_list.detail" + "/random/" + Math.random();
        $(document).ready(function () {
            $.fancybox({
                'width': '99%',
                'height': '95%',
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


    function add_procedure() {
        var viewurl = "{{$BASE_URL}}recruitment_list.view_procedure" + "/random/" + Math.random();

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

    function viewLog(id) {
        var viewurl = "{{$BASE_URL}}recruitment_list.view_log" + "/{{$ID}}/" + id;
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

<style>
    .tooltip {
        position: relative;
        /* display: inline-block;*/
        border: 0px solid !important;
        margin-top: 5px;

    }

    .tooltip .tooltiptext {
        visibility: hidden;
        width: 500px;
        background-color: black;
        color: #fff;
        text-align: center;
        border-radius: 6px;
        padding: 5px 5px;
        display: block;
        margin-left: 20px;
        position: absolute;
        z-index: 1;
    }

    .tooltip:hover .tooltiptext {
        visibility: visible;
    }

    #fancybox-wrap {
        z-index: 9999999;
    }
</style>

<h3 class="page-title">{{$title}}</h3>
<br />
<table width="100%">
    <tr>
        <td></td>
        <td>
            <form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
                <div style="float:left;">
        </td>
        <td>
            <input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" />
            &nbsp;&nbsp;
          <span style="font-size:18px;"><a href="https://recruitments.deckquotes.com.au/login" target="_blank">Click Here To Open Recruitment Website</a></span>
            <br />
            <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Search:</strong>&nbsp;&nbsp;</span>
            <input type="text" name="{{$TABLE}}[keyword]" value="{{$keyword}}" style="width:400px;"
                placeholder="Search by Name, Position" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <input type="submit" value="Search" name="search" />
            </div>


            <div style="float:right;">
                <input type="submit" name="showall" value="Show Hidden" />
                <input type="button" name="Add New " value="Add New" onclick="javascript:add_new();" />
                </form>
            </div>
        </td>
    </tr>
</table>

<div style="float:left; width:100%;">
    <table id="doclist-table" class="nav-back" width="100%">
        <thead>
            <tr>
                <th class="topmenu" align="center" valign="middle" width="2%">Id.</th>
                <th class="topmenu" align="center" valign="middle" width="10%">Name</th>
                <th class="topmenu" align="center" valign="middle" width="5%">Phone</th>
                <th class="topmenu" align="center" valign="middle" width="7%">Email</th>
                <th class="topmenu" align="center" valign="middle" width="3%" data-col="re_is_login_enabled">Login Enabled</th>
                <th class="topmenu" align="center" valign="middle" width="3%" data-col="recruitment_list_log">Download Doc Log</th>
                <th class="topmenu" align="center" valign="middle" width="5%">Date</th>
                <th class="topmenu" align="center" valign="middle" width="6%">Position</th>
				<th class="topmenu" align="center" valign="middle" width="6%">Position Apply</th>
                <th class="topmenu" align="center" valign="middle" width="25%">Applicant Documents</th>
                <th class="topmenu" align="center" valign="middle" width="5%">Rating</th>
                <th class="topmenu" align="center" valign="middle" width="5%">Survey Results</th>
                <th class="topmenu" align="center" valign="middle" width="12%">Notes</th>
                <th class="topmenu" align="center" valign="middle" width="3%">Initial Survey Email Sent</th>
                <th class="topmenu" align="center" valign="middle" width="3%">Email 2 Sent</th>
                <th class="topmenu" align="center" valign="middle" width="5%">Recruitment Checklist</th>
                <th class="topmenu" align="center" valign="middle" width="5%">Onboarding Checklist</th>
                <th class="topmenu" align="center" valign="middle" width="3%">QED</th>
                <th class="topmenu" align="center" valign="middle" width="8%">Hide From Report</th>
                <th class="topmenu" align="center" valign="middle" width="7%">Action</th>
            </tr>
            {{if $list}}
        <tbody>
            <form name="mlist" method="post">
                {{assign var=countn value= $numstartvounter}}
                {{foreach from=$list key="key" item="item"}}
                <tr bgcolor="{{cycle values=" #D3E8D6,WHITE" advance=true}}">
                    <td>{{$item.re_id}}.</td>
                    <td>{{$item.re_name}}</td>
                    <td>{{$item.re_phone}}</td>
                    <td>{{$item.re_email}}</td>
                    <td data-col="re_is_login_enabled">
                        <form name="recmet2" method="post" action="">
                            <input type="hidden" name="login[{{$item.re_id}}]" value="0" />
                            <label class="switch">
                                <input class="switch-input" type="checkbox" name="login[{{$item.re_id}}]" value="1"
                                    onclick="this.form.submit();" {{if $item.re_is_login_enabled eq 1 }} checked="checked"
                                    {{/if}}>
                                <span class="switch-label" data-on="Yes" data-off="No"></span>
                                <span class="switch-handle"></span> <br>
                            </label>
                        </form>
                    </td>
                    <td data-col="recruitment_list_log">
                        <input type="button" name="proc_panel" value="LOG" onclick="javascript:viewLog({{$item.re_id}});" />
                    </td>
                    <td>{{$item.re_date}}</td>
                    <td>{{$item.re_position}}</td>
					<td data-col="positions_apply"></td>
                    <td>
                        <div class="tooltip">
                            {{if $item.re_survey_link}}
                            <!--            <a href="https://deckquote.s3.amazonaws.com/files/meeting_minutes_doc/{{$item.re_survey_link}}?dummy={{$ran}}" target="_blank" style="padding-bottom:2px;">{{$item.re_survey_link|truncate:70:"...":true}}</a>-->

                            <a href="/recruitment_list.download_content?file_name={{$item.re_survey_link}}&module_name=recruitment_list.home"
                                target="_blank"
                                style="padding-bottom:2px;">{{$item.re_survey_link|truncate:70:"...":true}}</a>

                            <span class="tooltiptext">{{$item.re_survey_link|stripslashes}}</span><br> {{/if}}
                        </div>
                        <div class="tooltip">
                            {{if $item.re_doc2}}
                            <!--              <a href="https://deckquote.s3.amazonaws.com/files/meeting_minutes_doc/{{$item.re_doc2}}?dummy={{$ran}}" target="_blank" style="padding-bottom:2px;">{{$item.re_doc2|truncate:70:"...":true}}</a>-->

                            <a href="/recruitment_list.download_content?file_name={{$item.re_doc2}}&module_name=recruitment_list.home"
                                target="_blank" style="padding-bottom:2px;">{{$item.re_doc2|truncate:70:"...":true}}</a>

                            <span class="tooltiptext">{{$item.re_doc2|stripslashes}}</span> <br /> {{/if}}
                        </div>
                        <div class="tooltip">
                            {{if $item.re_doc3}}
                            <!--              <a href="https://deckquote.s3.amazonaws.com/files/meeting_minutes_doc/{{$item.re_doc3}}?dummy={{$ran}}" target="_blank">{{$item.re_doc3|truncate:70:"...":true}}</a>-->

                            <a href="/recruitment_list.download_content?file_name={{$item.re_doc3}}&module_name=recruitment_list.home"
                                target="_blank">{{$item.re_doc3|truncate:70:"...":true}}</a>

                            <span class="tooltiptext">{{$item.re_doc3|stripslashes}}</span> {{/if}}
                        </div>
                    </td>
                    <td>{{$item.re_rating}}</td>
                    <td>{{if $item.re_survey_result}}
                        <a href="/recruitment_list.download_content?file_name={{$item.re_survey_result}}&module_name=recruitment_list.home"
                            target="_blank">{{$item.re_survey_result}}</a>
                        {{/if}}
                    </td>
                    <td>{{$item.re_notes}}</td>
                    <td>
                        <form name="recmet2" method="post" action="">
                            <input type="hidden" name="email_1[{{$item.re_id}}]" value="0">
                            <label class="switch">
                                <input class="switch-input" type="checkbox" name="email_1[{{$item.re_id}}]" value="1"
                                    onclick="this.form.submit();" {{if $item.re_email_1_sent eq 1 }} checked="checked"
                                    {{/if}}>
                                <span class="switch-label" data-on="Yes" data-off="No"></span>
                                <span class="switch-handle"></span> <br>
                            </label>
                        </form>
                        {{if $item.re_email_1_sent eq 1 }} {{$item.re_email_1_user}}<br />{{$item.re_email_1_date}}
                        {{/if}}
                    </td>
                    <td>
                        <form name="recmet2" method="post" action="">
                            <input type="hidden" name="email_2[{{$item.re_id}}]" value="0" />
                            <label class="switch">
                                <input class="switch-input" type="checkbox" name="email_2[{{$item.re_id}}]" value="1"
                                    onclick="this.form.submit();" {{if $item.re_email_2_sent eq 1 }} checked="checked"
                                    {{/if}}>
                                <span class="switch-label" data-on="Yes" data-off="No"></span>
                                <span class="switch-handle"></span> <br />

                            </label>
                        </form>
                        {{if $item.re_email_2_sent eq 1 }} {{$item.re_email_2_user}}<br />{{$item.re_email_2_date}}
                        {{/if}}
                    </td>

                    <td>
                        {{if $item.re_recruitment_checklist}} <a href="{{$item.re_recruitment_checklist}}"
                            target="_blank"> Link </a> <a
                            href="{{$BASE_URL}}recruitment_list.delete_link/rc_link/{{$item.re_id}}"
                            onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;"
                            title="Delete"><img src="{{$BASE_URL}}css/admin/images/deletecross.png" width="16" /></a>
                        {{else}}
                            <form name="rec_check" action="" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="re_id" value="{{$item.re_id}}" />
                                <input type="text" name="re_recruitment_checklist" required="required"
                                    style="width:100px;" />
                                <input type="submit" name="save_rc" value="Save">
                            </form>
                            {{/if}}

                    </td>

                    <td>
                        {{if $item.re_onboarding_checklist}} <a href="{{$item.re_onboarding_checklist}}"
                            target="_blank"> Link </a> <a
                            href="{{$BASE_URL}}recruitment_list.delete_link/oc_link/{{$item.re_id}}"
                            onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;"
                            title="Delete"><img src="{{$BASE_URL}}css/admin/images/deletecross.png" width="16" /></a>
                        {{else}}
                            <form name="rec_check" action="" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="re_id" value="{{$item.re_id}}">
                                <input type="text" name="re_onboarding_checklist" required="required"
                                    style="width:100px;">
                                <input type="submit" name="save_oc" value="Save">
                            </form>
                            {{/if}}

                    </td>

                    <td>{{if $item.re_qed eq 1}} Yes
                        {{else}} No {{/if}}
                    </td>
                    <td>
                        <form name="recmet2" method="post" action="">
                            <input type="hidden" name="hide[{{$item.re_id}}]" value="0">
                            <label class="switch">
                                <input class="switch-input" type="checkbox" name="hide[{{$item.re_id}}]" value="1"
                                    onclick="this.form.submit();" {{if $item.re_hide eq 1 }} checked="checked"
                                    {{/if}}>
                                <span class="switch-label" data-on="Yes" data-off="No"></span>
                                <span class="switch-handle"></span> <br>

                            </label>
                        </form>
                    </td>
                    <td><a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"> <img
                                style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"></a>

                        <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}"
                            onclick="javascript:if(!confirm('Are you sure want to delete the listing? Because it will delete all the document related to this listing.')) return false;"
                            title="Delete"><img style="height: 20px;; width:20px"
                                src="{{$BASE_URL}}css/admin/images/delete.png"></a>

                    </td>
                </tr>
                {{assign var=countn value=$countn+1}}
                {{/foreach}}
        </tbody>

        </form>
        {{/if}}
    </table>
    {{if $last > 1}}
    <table width="90%" border="0" cellpadding="0" cellspacing="0">
        <tr> {{if $list}}
            <td align="center">
                <div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>� previous</span>
                    {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation=" x - y"
                            x=$pagenum y=1}}" title="Previous">� previous</a> {{/if}}

                        {{if $pagenum != 1}} <span class="paginate"><a class="pagination"
                                href="{{$BASE_URL}}{{$XFA.home}}/pagenum/1" title="{{$page_num}} Page">1</a></span>
                        {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a
                                    class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/2"
                                    title="{{$page_num}} Page">2</a></span>
                            {{else}}<span class='current'>2</span> {{/if}}
                                {{if $paginateprev.0 > 3}}
                                ...
                                {{/if}}
                                {{foreach from=$paginateprev key="page_key" item="page_num"}}
                                {{if $page_num == $pagenum OR $page_num <= 2}}
                                {{elseif $page_num == $lastone}}

                                {{else}} <span class="paginate"><a class="pagination"
                                            href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num}}"
                                            title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
                                    {{/foreach}}

                                    {{foreach from=$paginatenext key="page_key" item="page_num2"}}
                                    {{if $page_num2 < $last AND $page_num2 != $lastone}}
                                    {{if $page_num2 == 1}}
                                    {{elseif $page_num2 == 2}}
                                    {{else}}
                                        {{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'>
                                            {{$page_num2}}</span>
                                        {{else}} <a class="pagination"
                                                href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num2}}"
                                                title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
                                            {{/if}}
                                            {{/if}}
                                            {{/foreach}}
                                            {{if $page_num2 < $lasttow}}
                                            ...
                                            {{/if}}
                                            {{if $lastone == 1}}
                                            {{elseif $lastone == 2}}
                                            {{else}}
                                                {{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span>
                                                {{else}} <a class="pagination"
                                                        href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$lastone}}"
                                                        title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
                                                    {{/if}}
                                                    {{if $last == 1}}
                                                    {{elseif $last == 2}}
                                                    {{else}}
                                                        {{if $pagenum == $last}} <span class='current'>{{$last}}</span>
                                                        {{else}} <a class="pagination"
                                                                href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$last}}"
                                                                title="{{$last}} Page">{{$last}}</a> {{/if}}
                                                            {{/if}}
                                                            {{if $pagenum == $last}} <span class='disabled'>next
                                                                �</span>
                                                            {{else}} <a class="pagination"
                                                                    href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="
                                                                    x + y" x=$pagenum y=1}}" title="Next">next �</a>
                </div>
                {{/if}}
            </td>
            {{else}}
                <td align="center" height="300">Record Not found... </td>
                {{/if}}
        </tr>
    </table>
    {{/if}} <br />
    <br />
    <table id="doclist-table" width="100%" bgcolor="#d3e8d6">
        <thead>

            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
        </thead>
    </table>
</div>