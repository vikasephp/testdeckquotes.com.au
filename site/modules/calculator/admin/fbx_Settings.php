<?php
/*
<fusedoc fuse="fbx_Settings.php">
	<responsibilities>
		I set up the enviroment settings for this circuit. If this settings file is being inherited, then you can set a variable outright to override a value set in a parent circuit or use if(!isset(...)) to accept a value set by a parent circuit
	</responsibilities>
</fusedoc>
*/

require_once(MODULES_DIR . 'admin.init.php');
// module names
$MODULE_SINGULAR = 'Calculator Decking';
$MODULE_PLURAL = 'Calculator Deckings';
$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;
$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;

// module table and id
$TABLE = 'calculator_decking_new';
$ID = 'cd_id';
$fwViewData['TABLE'] = $TABLE;
$fwViewData['ID'] = $ID;

$TABLEWR = 'calculator_wrapping_new';
$IDWR = 'cw_id';
$fwViewData['TABLEWR'] = $TABLEWR;
$fwViewData['IDWR'] = $IDWR;

$TABLESF = 'calculator_subframe';
$IDSF = 'csf_id';
$fwViewData['TABLESF'] = $TABLESF;
$fwViewData['IDSF'] = $IDSF;

$TABLEHR = 'calculator_handrail';
$IDHR = 'chr_id';
$fwViewData['TABLEHR'] = $TABLEHR;
$fwViewData['IDHR'] = $IDHR;

$TABLEST = 'calculator_stairs';
$IDST = 'cst_id';
$fwViewData['TABLEST'] = $TABLEST;
$fwViewData['IDST'] = $IDST;

// fuseactions
$XFA['list'] = $Fusebox['circuit'] . '.list';
$XFA['detail'] = $Fusebox['circuit'] . '.detail';
$XFA['delete'] = $Fusebox['circuit'] . '.delete';

$XFA['list_wrapping'] = $Fusebox['circuit'] . '.list_wrapping';
$XFA['detail_wrapping'] = $Fusebox['circuit'] . '.detail_wrapping';

$XFA['list_subframe'] = $Fusebox['circuit'] . '.list_subframe';
$XFA['detail_subframe'] = $Fusebox['circuit'] . '.detail_subframe';

$XFA['list_handrail']   = $Fusebox['circuit'] . '.list_handrail';
$XFA['detail_handrail'] = $Fusebox['circuit'] . '.detail_handrail';

$XFA['list_stairs']   = $Fusebox['circuit'] . '.list_stairs';
$XFA['detail_stairs'] = $Fusebox['circuit'] . '.detail_stairs';