<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$table = new Fw_Db_Table($TABLE);

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];
	
	//db($this_id);
        //exit;
	
	$detail['co_notes'] = stripslashes($detail['co_notes']);
	unset($detail[$ID]);
	
	
	$table->setWhere("co_company_name = '".$detail['co_company_name']."'");
	if((!$table->rowExists()) OR !empty($this_id))
	{
		if($this_id > 0)
		{
			 $table->setWhere("$ID = $this_id");
			 $opr = $table->updateRow($detail);   
		}
		else
		{
			 $opr = $table->insertRow($detail); 
		}    	
	  
		$fwViewData['opr'] = $opr;
		
	} else {
		$fwViewData['msg'] = "Company Already Exists";
		$fwViewData['detail'] = $detail;
	}
		
		//Location(BASE_URL . $XFA['home']);
}

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0)
{
	$table = new Fw_Db_Table($TABLE);
	$table->setWhere("$ID = $this_id");
	$detail = $table->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}


//$sql_cc1 = "SELECT  * from type_master where tm_type like '%Companies Categories%'";
//$cc_id = $fwDb->queryOne($sql_cc1);		
//
//$sql_cc2 = "SELECT  * from type_options where to_type_id  =  ".$cc_id['tm_id'];
//$ccdata = $fwDb->query($sql_cc2);

$sql_cg = "Select * from category_options";
$ccdata = $fwDb->query($sql_cg);
$fwViewData['catgdetail'] = $ccdata ;

$sql_bs = "SELECT  * from busness_status ";
$fwViewData['bsdata'] = $fwDb->query($sql_bs);	

$sql_rd = "SELECT  * from type_master where tm_type like '%Responsible Department%'";
$rd_id = $fwDb->queryOne($sql_rd);		

$sql_rd2 = "SELECT  * from type_options where to_type_id  =  ".$rd_id['tm_id'];
$rddata = $fwDb->query($sql_rd2);
$fwViewData['rddata'] = $rddata ;
