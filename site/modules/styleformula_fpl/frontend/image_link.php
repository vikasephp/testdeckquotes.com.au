<?php
$fwMainView = 'file:' . getcwd() . '/image_link.tpl';
$tablecats = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');
$user_id = $_SESSION['user']['user_id'];

$tableGallary = new Fw_Db_Table("galleries_fpl");
$fwViewData['imagedata'] = $tableGallary->getRows();

$sf_id = $fwRequest->getParam('sf_id', '');

$sql = "select style_formula_fpl.sf_link_uid  from style_formula_fpl where style_formula_fpl.sf_id = ".$sf_id;
$data = $fwDb->queryOne($sql);

 $fwViewData['sf_link_uid'] = $data['sf_link_uid'];

if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	
	$this_id = $detail['sf_id'];
	$sf_link_uid = $detail['id'][0];
	
	$imageDetail['sf_link_uid'] = $sf_link_uid;
	
	
    unset($detail[$ID]);
   
      if($this_id > 0)
    	{
        $tablecats->setWhere("$ID = $this_id");
		
        $opr = $tablecats->updateRow($imageDetail);   
    	}
     

	$fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0)
{
	$tablecats = new Fw_Db_Table($TABLE);
	$tablecats->setWhere("$ID = $this_id");
	$fwViewData['detail'] = $tablecats->getRow();
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}


