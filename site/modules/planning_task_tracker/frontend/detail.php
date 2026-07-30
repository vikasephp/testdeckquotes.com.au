<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table('project_planning_checklist');
$tableppcAdmin = new Fw_Db_Table('planning_project_checklist_admin');
$submit = $fwRequest->getParam('subAddDetail', '');
$pc_id = $fwRequest->getParam('pc_id', '');

if(!empty($submit))
{
    $doc = $fwRequest->getParam('doc', array());
		
	$this_id = (int)$doc['pc_id'];
    $pc_doc_id = (int)$doc['pc_doc_id'];
	
	//$doc2['pc_id'] = $doc['pc_id'];
	//$doc2['pc_live_link'] = $doc['ppc_md_checklist_link'];
	
	$doc['pc_live_link_date'] = date('d-m-Y');
	$doc['pc_live_link_user'] = $_SESSION['user']['user_name'];
	
	$doc['pc_design_plan_user'] = date('d-m-Y');
	$doc['pc_design_plan_date'] = $_SESSION['user']['user_name'];
		
	$docadmin['ppc_id'] = $doc['pc_id'];
    $docadmin['ppc_md_checklist_link'] = $doc['ppc_md_checklist_link'];
	
	unset($doc2['pc_id']);
	
	   if($this_id > 0)
    	{
		
       		 $tableqa->setWhere("pc_id = $this_id");
	     	 $opr = $tableqa->updateRow($doc);
			 
			 $tableppcAdmin->setWhere("ppc_id = $pc_doc_id");
	     	 $opr = $tableppcAdmin->updateRow($docadmin);
    	}
	 	
    
    $fwViewData['opr'] = $opr;
		
		//Location(BASE_URL . $XFA['home']);
}

$this_id = (int)$fwRequest->getParam('pc_id', 0);
if ($this_id > 0)
{
	$sql = "select pc_doc_id from project_planning_checklist where pc_id = ".$this_id;
	$data = $fwDb->queryOne($sql);
	

	
	$sql2 = "select ppc_md_checklist_link from planning_project_checklist_admin where ppc_id = ".$data['pc_doc_id'];
	$data2 = $fwDb->queryOne($sql2);

	
	$tableqa = new Fw_Db_Table('project_planning_checklist');
	$tableqa->setWhere("pc_id = $this_id");
    $doc_data = $tableqa->getRow();
	$doc_data['ppc_md_checklist_link'] = $data2['ppc_md_checklist_link'];
	
	$fwViewData['doc_data'] = $doc_data;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;	

}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}

	