<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<script src="{{$BASE_URL}}js/ckeditor2/ckeditor.js"></script>
<style>
.productpage-image-preview {
	margin-top: 8px;
}
.productpage-image-preview img {
	max-width: 180px;
	max-height: 140px;
	border: 1px solid #ccc;
	padding: 3px;
	background: #fff;
}
.productpage-image-meta {
	font-size: 12px;
	color: #555;
	margin-top: 4px;
}
.productpage-doc-row {
	margin-bottom: 10px;
	padding-bottom: 10px;
	border-bottom: 1px solid #eee;
}
.productpage-doc-row label {
	display: inline-block;
	width: 55px;
	font-weight: bold;
	font-size: 12px;
}
.productpage-doc-row input[type="text"] {
	width: 420px;
	margin-bottom: 4px;
}
.productpage-doc-actions {
	margin-top: 6px;
}
.productpage-doc-hint {
	font-size: 12px;
	color: #666;
	margin-top: 6px;
}
</style>

{{if $opr}}
<script type="text/javascript">
    setTimeout('parent.close_win();', 500);
</script>
{{/if}}
<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">{{$page_title}}</h3>
    <form name="detail" method="post" action="{{$BASE_URL}}business.productpage_edit/pi_id/{{$detail.pi_id}}" enctype="multipart/form-data">
        <table id="list-table" width="100%">
            {{if $error}}
            <tr>
                <th colspan="2" style="color:#FF0000;">{{$error}}</th>
            </tr>
            {{/if}}
            <tr>
                <th>Brand/Manufacturer</th>
                <td>
                    <input type="text" name="data[pi_brand]" style="width:500px" value="{{$detail.pi_brand}}" />
                </td>
            </tr>
            <tr>
                <th>Model / Product Code</th>
                <td>
                    <input type="text" name="data[pi_product_code]" style="width:500px" value="{{$detail.pi_product_code}}" />
                </td>
            </tr>
            <tr>
                <th>Description</th>
                <td>
                    <textarea name="data[pi_description]" id="pi_description" class="ckeditor" cols="80" rows="8">{{$detail.pi_description}}</textarea>
                </td>
            </tr>
            <tr>
                <th>Product Supplier Name</th>
                <td>
                    <input type="text" name="data[pi_supplier_name]" style="width:500px" value="{{$detail.pi_supplier_name}}" />
                </td>
            </tr>
            <tr>
                <th>Trade That Installed</th>
                <td>
                    <input type="text" name="data[pi_trade_that_installed]" style="width:500px" value="{{$detail.pi_trade_that_installed}}" />
                </td>
            </tr>
            <tr>
                <th>Warranty Period</th>
                <td>
                    <input type="text" name="data[pi_warranty_period]" style="width:500px" value="{{$detail.pi_warranty_period}}" />
                </td>
            </tr>
            <tr>
                <th>Documents / Links</th>
                <td>
                    <div id="productpage-doc-list">
                        {{foreach from=$documents item="doc" name="docloop"}}
                        <div class="productpage-doc-row">
                            <div>
                                <label>Name</label>
                                <input type="text" name="documents[{{$smarty.foreach.docloop.index}}][name]" value="{{$doc.pid_name|escape:'html'}}" />
                            </div>
                            <div>
                                <label>Link</label>
                                <input type="text" name="documents[{{$smarty.foreach.docloop.index}}][link]" value="{{$doc.pid_link|escape:'html'}}" />
                            </div>
                            <div class="productpage-doc-actions">
                                <input type="button" value="Remove" class="vsml" onclick="ProductpageDocs.removeRow(this); return false;" />
                            </div>
                        </div>
                        {{/foreach}}
                    </div>
                    <input type="button" id="productpage-doc-add" value="Add Document Link" class="vsml" onclick="ProductpageDocs.addRow(); return false;" />
                    <div class="productpage-doc-hint">You can add up to {{$max_documents}} document links.</div>
                </td>
            </tr>
            <tr>
                <th>Upload Image :</th>
                <td>
                    <input type="file" name="pi_image" accept="image/jpeg,image/png,image/gif,image/webp" />
                    {{if $detail.pi_image}}
                    <div class="productpage-image-preview">
                        <a href="{{$image_url_base}}{{$detail.pi_image}}" target="_blank" title="Open image">
                            <img src="{{$image_url_base}}{{$detail.pi_image}}" alt="Product image" />
                        </a>
                        <div class="productpage-image-meta">{{$detail.pi_image}}</div>
                        <label style="display:inline-block; margin-top:6px;">
                            <input type="checkbox" name="remove_image" value="1" /> Remove current image
                        </label>
                    </div>
                    {{/if}}
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();"
                        class="vsml" />
                </td>
            </tr>
        </table>
    </form>

    <script type="text/javascript">
        function closepop() {
            setTimeout('parent.close_win();', 500);
        }

        var ProductpageDocs = {
            max: {{$max_documents}},

            getRows: function() {
                return document.querySelectorAll('#productpage-doc-list .productpage-doc-row');
            },

            reindex: function() {
                var rows = this.getRows();
                for (var i = 0; i < rows.length; i++) {
                    var inputs = rows[i].querySelectorAll('input[type="text"]');
                    if (inputs[0]) { inputs[0].name = 'documents[' + i + '][name]'; }
                    if (inputs[1]) { inputs[1].name = 'documents[' + i + '][link]'; }
                }
                this.updateAddButton();
            },

            updateAddButton: function() {
                var btn = document.getElementById('productpage-doc-add');
                if (!btn) { return; }
                btn.disabled = this.getRows().length >= this.max;
            },

            addRow: function() {
                var rows = this.getRows();
                if (rows.length >= this.max) {
                    alert('Maximum ' + this.max + ' document links allowed.');
                    return;
                }
                var wrap = document.getElementById('productpage-doc-list');
                var div = document.createElement('div');
                div.className = 'productpage-doc-row';
                div.innerHTML =
                    '<div><label>Name</label> <input type="text" name="documents[0][name]" value="" /></div>' +
                    '<div><label>Link</label> <input type="text" name="documents[0][link]" value="" /></div>' +
                    '<div class="productpage-doc-actions"><input type="button" value="Remove" class="vsml" onclick="ProductpageDocs.removeRow(this); return false;" /></div>';
                wrap.appendChild(div);
                this.reindex();
            },

            removeRow: function(btn) {
                var row = btn;
                while (row && ('' + row.className).indexOf('productpage-doc-row') === -1) {
                    row = row.parentNode;
                }
                if (!row) { return; }
                var list = document.getElementById('productpage-doc-list');
                if (this.getRows().length <= 1) {
                    var inputs = row.querySelectorAll('input[type="text"]');
                    for (var i = 0; i < inputs.length; i++) {
                        inputs[i].value = '';
                    }
                    return;
                }
                list.removeChild(row);
                this.reindex();
            }
        };

        if (typeof CKEDITOR !== 'undefined') {
            CKEDITOR.replace('pi_description', {
                height: 220,
                width: 520,
                removePlugins: 'elementspath',
                resize_enabled: true
            });
        }

        var detailForm = document.forms['detail'];
        if (detailForm) {
            detailForm.onsubmit = function () {
                if (typeof CKEDITOR !== 'undefined') {
                    for (var instance in CKEDITOR.instances) {
                        if (CKEDITOR.instances.hasOwnProperty(instance)) {
                            CKEDITOR.instances[instance].updateElement();
                        }
                    }
                }
                return true;
            };
        }

        ProductpageDocs.reindex();
    </script>
</div>
