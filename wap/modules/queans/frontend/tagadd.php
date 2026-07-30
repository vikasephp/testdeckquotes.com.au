<?php
$fwMainView = 'file:' . getcwd() . '/tagadd.tpl';
$tabletags = new Fw_Db_Table($TABLE_TAG);
$submit = $fwRequest->getParam('subAddDetail', '');
$test = $fwRequest->getParam('test', '');


if(!empty($submit))
{
	$tag_userid  =  $_SESSION['user']['user_id'];
		
	$detail = $fwRequest->getParam($TABLE_TAG, array());
	$this_id = (int)$detail[$ID_TAG];
    
	unset($detail[$ID_TAG]);
	
	$detail['tag_userid'] = $tag_userid;
	//if($detail['tags']): $detail['tags'] = implode(",", $detail['tags']);  endif;
   
    if($this_id > 0)
    	{
        $tabletags->setWhere("$ID = $this_id");
        $opr = $tabletags->updateRow($detail);   
    	} else{ $opr = $tabletags->insertRow($detail); }    	
	$fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0)
{
	$tabletags = new Fw_Db_Table($TABLE);
	$tabletags->setWhere("$ID = $this_id");
	$detail = $tabletags->getRow();
	if($detail['tags']): $detail['tags'] = explode(",", $detail['tags']); else:$detail['tags'] = array(); endif;
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}

//$tablePages = new Fw_Db_Table("style_formula_types");
//$tablePages->setWhere("sft_statues = 'Active'");
//$tablePages->setOrderBy('sft_title ASC');
//$fwViewData['formulatypes']=$tablePages->getRows();