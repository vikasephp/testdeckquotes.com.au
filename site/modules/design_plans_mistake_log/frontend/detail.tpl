<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />

{{if $opr}}
<script type="text/javascript">
    setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px; padding-top: 40px;">
    <h3 class="page-title">Edit {{ $MODULE_SINGULAR }}</h3>
    <form action="" id="uploadForm" method="post" enctype="multipart/form-data" name="iframe-form" autocomplete="off">
        <input type="hidden" name="doc[{{ $ID }}]" value="{{$record.$ID}}" />
        <table cellpadding="0" cellspacing="0" class="table" id="list-table">
            <tr>
                <td><strong>Project:</strong></td>
                <td>
                    <input type="text" name="doc[dpml_bsn_id]" value="{{$record.dpml_bsn_id}}" style="width:700px;" list="project" />
                    <datalist id="project">
                        {{ foreach from=$projdetail key="index" item="row" }}
                        <option value="{{ $row.bsn_name }}" {{ if $row.bsn_name eq $record.dpml_bsn_id }}selected{{ /if }}>{{ $row.bsn_name }}</option>
                        {{ /foreach }}
                    </datalist>
                </td>
            </tr>
            <tr>
                <td><strong>Plan:</strong></td>
                <td>
                   <!-- <input type="text" name="doc[dpml_title]" value="{{$record.dpml_title}}" style="width:700px;" />-->
                    
                    
              <select name="doc[dpml_plan]" />
                    <option value="0" {{if $item.dpml_plan eq "0"}} selected="selected" {{/if}}>Please Select </option>
                    {{foreach from = $plansData key="key5" item="item5"}}
                    <option value="{{$item5.dp_id}}" {{if $item5.dp_id eq $record.dpml_plan}} selected="selected" {{/if}}>{{$item5.dp_option}}</option>
                    {{/foreach}}
                         
              </select>
   		
                </td>
            </tr>
            <!-- <tr>
                <td><strong>Date Logged:</strong></td>
                <td>
                    <input type="date" name="doc[dpml_logged_date]" value="{{$record.dpml_logged_date}}" style="width:700px;" />
                </td>
            </tr> -->
            <tr>
                <td><strong>Mistake:</strong></td>
                <td>
                    <textarea name="doc[dpml_mistake]" style="width:700px;" rows="4">{{ $record.dpml_mistake }}</textarea>
                </td>
            </tr>
            <tr>
                <td><strong>Type:</strong></td>
                <td>
                    <select name="doc[dpml_type_id]" style="width: auto;">
                        <option value="0">Select Type</option>
                        {{ assign var=option_col value=$ATTRIBUTES[0].option_col }}
                        {{ assign var=option_id value=$ATTRIBUTES[0].id }}
                        {{ foreach from=$typedata key="index" item="row" }}
                        <option value="{{ $row.$option_id }}" {{ if $row.$option_id eq $record.dpml_type_id }}selected{{ /if }}>{{ $row.$option_col }}</option>
                        {{ /foreach }}
                    </select>
                </td>
            </tr>
            <tr>
                <td><strong>Snaphshot:</strong></td>
                <td>
                    <input type="file" name="dpml_snapshot" value="{{$record.dpml_snapshot}}" style="width:700px;" />
                    <br>
                    {{ if $record.dpml_snapshot }}
                        <a href="/{{ $BASEFOLDER }}.download_content?file_name={{$record.dpml_snapshot}}&module_name={{ $BASEFOLDER }}.home" target="_blank">Download</a>
                    {{ /if }}
                </td>
            </tr>
            <tr>
                <td><strong>Architect Responsible:</strong></td>
                <td>
                    <input type="text" name="doc[dpml_architect_responsible]" value="{{$record.dpml_architect_responsible}}" style="width:700px;" list="dpml_architect_responsible" />
                    <datalist id="dpml_architect_responsible">
                        {{ foreach from=$userData key="index" item="row" }}
                        <option value="{{ $row.user_name }}" {{ if $row.user_name eq $record.dpml_architect_responsible }}selected{{ /if }}>{{ $row.user_name }}</option>
                        {{ /foreach }}
                    </datalist>
                </td>
            </tr>
            <tr>
                <td><strong>Designer:</strong></td>
                <td>
                    <input type="text" name="doc[dpml_designer]" value="{{$record.dpml_designer}}" style="width:700px;" list="dpml_designer" />
                    <datalist id="dpml_designer">
                        {{ foreach from=$userData key="index" item="row" }}
                        <option value="{{ $row.user_name }}" {{ if $row.user_name eq $record.dpml_designer }}selected{{ /if }}>{{ $row.user_name }}</option>
                        {{ /foreach }}
                    </datalist>
                </td>
            </tr>
            <tr>
                <td><strong>Who Picked up:</strong></td>
                <td>
                    <input type="text" name="doc[dpml_who_picked_up]" value="{{$record.dpml_who_picked_up}}" style="width:700px;" list="dpml_who_picked_up" />
                    <datalist id="dpml_who_picked_up">
                        {{ foreach from=$userData key="index" item="row" }}
                        <option value="{{ $row.user_name }}" {{ if $row.user_name eq $record.dpml_who_picked_up }}selected{{ /if }}>{{ $row.user_name }}</option>
                        {{ /foreach }}
                    </datalist>
                </td>
            </tr>
            <tr>
                <td><strong>Bonus Approved:</strong></td>
                <td>
                    <input id="dpml_bonus_approved_yes" type="radio" name="doc[dpml_bonus_approved]" value="YES" {{ if $record.dpml_bonus_approved eq 1 }}checked{{ /if }} />
                    <label for="dpml_bonus_approved_yes">YES</label>
                    <input id="dpml_bonus_approved_no" type="radio" name="doc[dpml_bonus_approved]" value="NO" {{ if $record.dpml_bonus_approved eq 0 }}checked{{ /if }} />
                    <label for="dpml_bonus_approved_no">NO</label>
                </td>
            </tr>
            <tr>
                <td><strong>Example/Evidence:</strong></td>
                <td>
                    <input type="text" name="doc[dpml_example_evidence]" value="{{$record.dpml_example_evidence}}" style="width:700px;" />
                    <br>
                 <!--   {{ if $record.dpml_example_evidence }}
                        <a href="/{{ $BASEFOLDER }}.download_content?file_name={{$record.dpml_example_evidence}}&module_name={{ $BASEFOLDER }}.home" target="_blank">Download</a>
                    {{ /if }}-->
                </td>
            </tr>
            <tr>
                <td><strong>Solution:</strong></td>
                <td>
                    <input type="text" name="doc[dpml_solution]" value="{{$record.dpml_solution}}" style="width:700px;" />
                </td>
            </tr>
            <tr>
                <td><strong>Solution Implemented:</strong></td>
                <td>
                    <input id="dpml_solution_implemented_yes" type="radio" name="doc[dpml_solution_implemented]" value="YES" {{ if $record.dpml_solution_implemented eq 1 }}checked{{ /if }} />
                    <label for="dpml_solution_implemented_yes">YES</label>
                    <input id="dpml_solution_implemented_no" type="radio" name="doc[dpml_solution_implemented]" value="NO" {{ if $record.dpml_solution_implemented eq 0 }}checked{{ /if }} />
                    <label for="dpml_solution_implemented_no">NO</label>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" value="Save" name="subAddDetail" id="uploadForm_submit_iframe" style="cursor:pointer;" />
                    <input type="button" value="Cancel" onclick="parent.$.fancybox.close();" style="cursor:pointer;" />
                </td>
            </tr>
        </table>
    </form>

    <script type="text/javascript">
        function closepop() {
            setTimeout('parent.close_win();', 500);
        }
    </script>
    <script>
        initSample();
    </script>