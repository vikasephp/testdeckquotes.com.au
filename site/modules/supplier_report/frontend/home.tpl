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
        if (type == 'manage_procedure') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_procedure" + "/random/" + Math.random();
        }
        else if (type == 'add_new') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_type" + "/random/" + Math.random();
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
<style>
.textarea {
	width: 90%;
}
.select {
	width: 100%;
}
</style>
<h3 class="page-title">{{$title}}</h3>
<br />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

<form name="mlist" method="post" enctype="multipart/form-data">
    <div style="float:left; text-align:left;">
        <div>
            <input type="button" name="sr_proc_panel" value="Procedure Panel" onclick="javascript:open_popup('manage_procedure');">&nbsp;
			<input type="button" name="add_new" value="Type" onclick="javascript:open_popup('add_new');">
        </div>
    </div>
    <div style="float: right; text-align: right;">
        <div></div>
    </div>
</form>

<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                <th class="topmenu" align="center" valign="middle">Sr. No.</th>
                <th class="topmenu" align="center" valign="middle">Supplier Name</th>
                <th class="topmenu" align="center" valign="middle">Type</th>
                <th class="topmenu" align="center" valign="middle">Supply Agreement link</th>
                <th class="topmenu" align="center" valign="middle">Open Warranty Log</th>
                <th class="topmenu" align="center" valign="middle">Pricing Payment Category</th>
				<th class="topmenu" align="center" valign="middle">Action</th>
            </tr>
        </thead>
        <tbody>
            {{ if $list }}
            {{ foreach from=$list key="key" item="item" }}
            <tr bgcolor="{{ cycle values='#D3E8D6,WHITE' advance=true }}">
                {{ assign var=sn value=$start_sn+$key }}
                <td data-col="sr. no.">{{ $sn }}</td>
				<td data-col="supplier_name">{{ $item.sr_supplier_name }}</td>
				<td data-col="type">
					{{if $resultType}}
					<select class="select" name="supplier_report[sr_type]"
						onchange="updateRecord('{{ $item.sr_id }}', 'sr_type', this.value)">
						<option value="">Select Type</option>
					{{ foreach from=$resultType key="keyT" item="itemT" }}
						<option value="{{$itemT.sr_type}}" {{if $item.sr_type eq $itemT.sr_type}}selected{{/if}}>{{$itemT.sr_type}}</option>
					{{/foreach}}
					</select>
					{{else}}
						No Type Available
					{{/if}}
				</td>
				<td data-col="supply_agreement_link">
					<!--<textarea class="textarea" name='supplier_report[sr_agreement_link]' onblur="updateRecord('{{ $item.sr_id }}', 'sr_agreement_link', this.value)">{{$item.sr_agreement_link}}</textarea>-->
					{{if $item.sr_agreement_link }}<a target="_blank" href="{{$item.sr_agreement_link}}">Link</a>{{/if}}
				</td>
				<td data-col="open_warranty_log">{{ $item.sr_open_count }}</td>
				<td data-col="pricing_payment_category">
					<input name='sr[pricing_payment_category]' name='supplier_report[sr_payment_category]' type="text" value="{{$item.sr_payment_category}}" onblur="updateRecord('{{ $item.sr_id }}', 'sr_payment_category', this.value)" />
				</td>
				<td data-col="action">
					<a class="various" href="{{$BASE_URL}}{{$BASEFOLDER}}.edit_supplyagreementlink/sr_id/{{$item.sr_id}}" title="Edit">
						<img style="height: 20px; width:20px;" src="/css/admin/images/edit.png">
					</a>
				</td>
            </tr>
            {{ /foreach }}
            {{ else }}
            <tr bgcolor="WHITE">
                <td colspan="6" style="text-align: center;">No Data Available</td>
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

<script>
    function updateRecord(primaryID, column, value, updateRecord = false) {
        const formData = {
            primaryID: primaryID,
            column: column,
            value: value,
            action: "updateRecord"
        };
        $.ajax({
            type: "POST",
            url: "{{$BASE_URL}}{{ $BASEFOLDER }}.ajax_handler",
            data: formData,
            dataType: "json",
            encode: true,
            success: function (data) {
                if (data.success == true) {
                    if(updateRecord){
                        //$('#' + column + primaryID).text(value);
                    }
                }
                else {
                    alert('Some problem in updating the record');
                }
            },
			error: function (xhr, status, error) {
				//console.log(formData);
				//console.log("AJAX Error Status:", status);
				//console.log("AJAX Error Detail:", error);
				//console.log("Full response:", xhr.responseText);

				//alert("AJAX Error: " + error); // this is where "undefined" came from
			}
        })
    }
</script>