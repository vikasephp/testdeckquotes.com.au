<?php
$fwMainView = 'file:' . getcwd() . '/courier_box.tpl';
$tableBusiness = new Fw_Db_Table($TABLE);
$table_cbdi = new Fw_Db_Table('cb_design_brouchures');

$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	$data = implode(",",$detail);
		
	$cbdetail['bsn_courier_box'] = $data;
			
    $tableBusiness->setWhere("bsn_id = " . $bsn_id );
	$preDetail = $tableBusiness->getRow();
	
	$dnum = explode(",",$preDetail['bsn_courier_box']);
	
	//foreach($dnum as $desgn)
	//{
	//	echo $desgn. " ";	
	//}
	//exit;
	
	$opr = $tableBusiness->updateRow($cbdetail);  
		
	foreach($detail as $dn)
	{
			if(!in_array($dn, $dnum))
			{
				$table_cbdi->setWhere("cb_design_number = ".$dn);
				$desDetail = $table_cbdi->getRow();
				$desDetail['cb_brochures_sent'] = $desDetail['cb_brochures_sent'] + 1;	
				$desDetail['cb_brochures_remaining'] = $desDetail['cb_brochures_remaining'] - 1;	
				$cbd = $table_cbdi->updateRow($desDetail); 
			}
	}
				
					
	$fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0)
{
	$tableqa = new Fw_Db_Table($TABLE);
	$tableqa->setWhere("$ID = $this_id");
	$detail2 = $tableqa->getRow();
	
	$fwViewData['design_num'] = explode(",",$detail2['bsn_courier_box']);
		
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}

	$tableDesignInterface = new Fw_Db_Table('design_interface');
	$tableDesignInterface->setOrderBy('di_design_number'.' ASC');
	$fwViewData['didetail'] = $tableDesignInterface->getRows();