<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<style>
	#fancybox-wrap {
		z-index: 99999999;
	}
	.table {
		width: 100%;
		margin: auto;
	}
	.table, .table tr, .table th, .table td {
		border: 1px solid #111;
		border-collapse: collapse;
	}
	.table th, .table td {
		padding: 6px 8px;
	}
	label.switch {
		margin-bottom: 0;
	}
</style>
<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<script>
	function close_win() {
		$.fancybox.close();
		window.location.reload();
	}
	function open_popup(type, viewurl = '') {
		if (type == 'view_item') {
			viewurl = "{{$BASE_URL}}itemAdmin.view_list" + "/random/" + Math.random();
		}
		else if (type == 'view_item_category') {
			viewurl = "{{$BASE_URL}}itemAdmin.view_category" + "/random/" + Math.random();
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
<div align="center" style="background-color:#FFFFFF; width: 98%; margin: 0 auto 50px;">
	<h3 class="page-title" style="margin-bottom: 30px;">{{ $title }}</h3>
	<form method="post" style="display: flex;">
		<div>
			<input type="button" name="" value="Items" onclick="javascript:open_popup('view_item');" />
			<input type="button" name="" value="Item Categories" onclick="javascript:open_popup('view_item_category');" />
			<input type="submit" name="sync_items" value="Sync Items" />
		</div>
	</form>
	<table id="" class="table">
		<thead>
			<tr>
				<th>Action</th>
				<th>Hide</th>
				<th>Item</th>
				<th>Brand</th>
				<th>Model / Product Code</th>
				<th>Description</th>
				<th>Product Supplier Name</th>
				<th>Did CGFB Supply?<br>(Yes/No)</th>
				<th>Trade That Installed</th>
				<th>Install Date</th>
				<th>Warranty Period</th>
				<th>Warranty Expiry Date</th>
				<th>Documents / Links</th>
				<th style="white-space: nowrap;"><!-- Checked -->Q/A</th>
			</tr>
		</thead>
		<tbody>
			{{if count($project_item_list) > 0}}
				{{foreach from=$project_item_list key="index" item="row"}}
					{{if $row.il_name}}
					<tr>
						<td>
							<a onclick="javascript:open_popup('', '{{$BASE_URL}}business.productpage_edit/pi_id/{{$row.pi_id}}');" href="javascript:void(0);" title="Edit"><img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>
						</td>
						<td>
							<label class="switch">
								<input class="switch-input" type="checkbox" {{if $row.pi_is_visible == 0 }} checked="checked" {{/if}} onclick="toggleValue({{$row.pi_id}}, 'pi_is_visible', this)">
								<span class="switch-label" data-on="Yes" data-off="No"></span> 
								<span class="switch-handle"></span>
							</label>
						</td>
						<td>{{$row.il_name}}</td>
						<td>{{$row.pi_brand}}</td>
						<td>{{$row.pi_product_code}}</td>
						<td>{{$row.pi_description}}</td>
						<td>{{$row.pi_supplier_name}}</td>
						<td>
							<label class="switch">
								<input class="switch-input" type="checkbox" {{if $row.pi_is_cgfb_supplied == 1 }} checked="checked" {{/if}} onclick="toggleValue({{$row.pi_id}}, 'pi_is_cgfb_supplied', this)">
								<span class="switch-label" data-on="Yes" data-off="No"></span> 
								<span class="switch-handle"></span>
							</label>
						</td>
						<td>{{$row.pi_trade_that_installed}}</td>
						<td>
							<div style="width: 100px;">
								<input type="text" value="{{$row.pi_installed_at}}" readonly="readonly" class="w16em dateformat-d-ds-m-ds-Y" style="width: 65px; margin: 0;" onfocus="updateRecord({{$row.pi_id}}, 'pi_installed_at', this.value)">
							</div>
						</td>
						<td>{{$row.pi_warranty_period}}</td>
						<td>
							<div style="width: 100px;">
								<input type="text" value="{{$row.pi_warranty_expired_at}}" readonly="readonly" class="w16em dateformat-d-ds-m-ds-Y" style="width: 65px; margin: 0;" onfocus="updateRecord({{$row.pi_id}}, 'pi_warranty_expired_at', this.value)">
							</div>
						</td>
						<td>
							{{if $row.pi_document_link}}
							<a href="{{$row.pi_document_link}}" target="_blank">View</a>
							{{/if}}
						</td>
						<td>
							<!-- <label class="switch">
								<input class="switch-input" type="checkbox" {{if $row.pi_is_checked == 1 }} checked="checked" {{/if}} onclick="toggleValue({{$row.pi_id}}, 'pi_is_checked', this)">
								<span class="switch-label" data-on="Yes" data-off="No"></span> 
								<span class="switch-handle"></span>
							</label> -->
							TBD
						</td>
					</tr>
					{{/if}}
				{{/foreach}}
			{{else}}
			<tr>
				<th style="text-align: center;" colspan="13">No Item Found</th>
			</tr>
			{{/if}}
		</tbody>			
	</table>
</div>

<script>
	function callAjax(formData, updateRecord=false) {
        $.ajax({
            type: "POST",
            url: "{{$BASE_URL}}business.productpage_ajax",
            data: formData,
            dataType: "json",
            encode: true,
            success: function (data) {
                if (data.success == true) {
                    if(updateRecord){
                        $('#' + column + primaryID).text(value);
                    }
                }
                else {
                    alert('Some problem in updating the record');
                }
            }
        })
    }

    function toggleValue(primaryID, column, element, updateRecord = false) {
        let value = 0;
		if(column == 'pi_is_visible') {
			value = $(element).is(":checked") ? 0 : 1;
		}
		else {
			value = $(element).is(":checked") ? 1 : 0;
		} 
        const formData = {
            primaryID: primaryID,
            column: column,
            value: value,
            action: "updateRecord"
        };
        callAjax(formData, updateRecord);
    }

	function updateRecord(primaryID, column, value, updateRecord = false) {
        const formData = {
            primaryID: primaryID,
            column: column,
            value: value,
            action: "updateRecord"
        };
        callAjax(formData, updateRecord);
    }
</script>