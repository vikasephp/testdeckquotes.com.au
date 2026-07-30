<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);
$fwViewData['wa_id'] = (int)$fwRequest->getParam('wa_id', 0);
$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
    	$detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];
	
	unset($detail[$ID]);
	
		
	
    if($this_id > 0)
    	{
       		 $tableqa->setWhere("$ID = $this_id");
	     	 $opr = $tableqa->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableqa->insertRow($detail); 
	}    	
    
    $fwViewData['opr'] = $opr;
		
		//Location(BASE_URL . $XFA['home']);
}

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0)
{
	$tableqa = new Fw_Db_Table($TABLE);
	$tableqa->setWhere("$ID = $this_id");
	$detail = $tableqa->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;	
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	

$sql = "SELECT  business.* from business";
$fwViewData['projdetail'] = $fwDb->query($sql);

$sqls = "select co_id, co_company_name from companies";
$fwViewData['supdetail'] = $fwDb->query($sqls);
	
$sqlti = "Select tm_id from type_master where tm_type = 'Urgency Rating'";
$type_id = $fwDb->queryOne($sqlti); 
 		
$sqlto = "Select to_id, to_option from type_options where to_type_id  = ". $type_id['tm_id'];

$fwViewData['todetail'] = $fwDb->query($sqlto); 	
	
$sql2= "select tm_id from type_master where tm_type = 'Construction Alert Report Team' " ;
$tmdata = $fwDb->queryOne($sql2); 

$sql2= "select to_option from type_options where to_type_id = ". $tmdata['tm_id'] ;
$fwViewData['who'] = $fwDb->query($sql2); 

$sql_s1= "select tm_id from type_master where tm_type = 'Alert Status' " ;
$tmdata = $fwDb->queryOne($sql_s1); 

$sql_s2= "select to_option from type_options where to_type_id = ". $tmdata['tm_id'] ;
$fwViewData['statusdata'] = $fwDb->query($sql_s2); 	

