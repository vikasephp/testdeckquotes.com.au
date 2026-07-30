<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tablecats = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
    $this_id = (int)$detail[$ID];
    unset($detail[$ID]);
	
if($_FILES['logo']['name'])	
	{
	$datetime = trim(date('d_m_Y_H_i_'),'0');
	$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $_FILES['logo']['name']);
	$path = BASE_DIR.'files/suppliers/logo/'.$docfile;		
	   $image = new SimpleImage();
	   $image->load($_FILES['logo']['tmp_name']);
	   $image->resizeToWidth(150);
	   $image->save($path);	
	   $detail['sp_logo'] =$docfile;
	}	
	
	
    if ($this_id > 0)
    	{
        $tablecats->setWhere("$ID = $this_id");
        $opr = $tablecats->updateRow($detail);   
    	}
    else
    	{
        $opr = $tablecats->insertRow($detail);
    	}    
  $fwViewData['opr'] = $opr;
}	

$this_id = (int)$fwRequest->getParam($ID, 0);

if ($this_id > 0)
{
	$tablecats->setWhere("$ID = $this_id");
	$detail = $tablecats->getRow();
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}