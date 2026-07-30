<?php
$tablePages = new Fw_Db_Table($TABLE);
$busness_statusTable = new Fw_Db_Table('busness_status');
$tablebusness_types = new Fw_Db_Table('project_type');

$cbs = $fwRequest -> getParam('cbs','');
$pos = $fwRequest -> getParam('pos','');

if(!empty($cbs))
	{
		$bst_business_status_id = $cbs;
	}
elseif($_SESSION['cbs'])
	{
		$bst_business_status_id = $_SESSION['cbs'];	
	}
else
	{
		$first_status = $busness_statusTable -> getRow();
		$bst_business_status_id = $first_status['st_id'];	
	}


if(!empty($pos)) {
	$fwViewData['pos_id'] = $pos;
	
		$posfilter = " and busness_status_task.bst_posid = ".$pos;	
}
else
{
	$posfilter = '';
}
$fwViewData['cbs_id'] = $bst_business_status_id;

$up = $fwRequest -> getParam('up',0);
$down = $fwRequest -> getParam('down',0);
$bst_id = $fwRequest -> getParam('bst_id',0);

if($down || $up)
  {
$minmaxsql = "SELECT MAX(bst_order) as maxord, MIN(bst_order) as minord FROM ".$TABLE;
$minmaxdata = $fwDb->queryOne($minmaxsql);
$allroderssql = "SELECT bst_order FROM ".$TABLE. " ORDER BY bst_order ASC";
$allroderdata = $fwDb->query($allroderssql);
	
	
	if($up)
		{
		
			if($up > $minmaxdata['minord'])
				{
					foreach($allroderdata as $k => $v)
							{
								if($up == $v['bst_order'])
									{
									$updateord = $allroderdata[$k-1]['bst_order'];
									}
							}
	
					//$updateord = (int)$up-1;
					$data['bst_order'] = $updateord;
					$data2['bst_order'] = (int)$up;
					$tablePages->setWhere("bst_order = ".$up);	
					$ldata = $tablePages->getRow(); 
					$tablePages->setWhere("bst_order = ".$updateord);
					$ndata = $tablePages->getRow(); 
					$tablePages->setWhere("bst_id = ".$ldata['bst_id']);
					$tablePages->updateRow($data);
					$tablePages->setWhere("bst_id = ".$ndata['bst_id']);
					$tablePages->updateRow($data2);	
				}		
		}
	if($down)
		{
			
			if($down < $minmaxdata['maxord'])
				{
	
	
				foreach($allroderdata as $k => $v)
							{
								if($down == $v['bst_order'])
									{
									$updateord = $allroderdata[$k+1]['bst_order'];
									}
							
							}

					//$updateord = (int)$down+1;
					$data['bst_order'] = $updateord;
					$data2['bst_order'] = (int)$down;
					$tablePages->setWhere("bst_order = ".$down);	
					$ldata = $tablePages->getRow(); 
					$tablePages->setWhere("bst_order = ".$updateord);
					$ndata = $tablePages->getRow(); 
					$tablePages->setWhere("bst_id = ".$ldata['bst_id']);
					$tablePages->updateRow($data);
					$tablePages->setWhere("bst_id = ".$ndata['bst_id']);
					$tablePages->updateRow($data2);	
				
				}		
		}
  }

/**** Begin task related to business status ***/
$bstasksql = "SELECT ".$TABLE.".*, project_type.*, positions.p_name, authorizearea.*, datafields.* FROM ".$TABLE." 
LEFT JOIN project_type ON ".$TABLE.".bst_business_types_id = project_type.pt_id
LEFT JOIN authorizearea ON ".$TABLE.".bst_aan = authorizearea.autha_id
LEFT JOIN datafields ON ".$TABLE.".bst_rdf = datafields.df_id
LEFT JOIN positions ON ".$TABLE.".bst_posid = positions.p_id 
ORDER BY ".$TABLE.".bst_order ASC";


$task = $fwDb->query($bstasksql);
foreach($task as $tsk):
			if($tsk['bst_business_types']): 
				$tsk['bst_business_types'] = unserialize($tsk['bst_business_types']);	
			endif;
		$newtask[] = $tsk;	
endforeach;
$fwViewData['task'] = $newtask;
/**** End task related to business status ***/

/**** Begin fetch all busness_status ***/
$allbusiness_status = $busness_statusTable -> getAllRows();
$fwViewData['allbusiness_status'] =  $allbusiness_status;
/**** End fetch all busness_status ***/

$msg =  $fwRequest -> getParam('msg','');
if($msg == 1)
{
	$msg = "One Record Updated Successfully";
}
elseif($msg == 2)
{
	$msg = "One Record Inserted Successfully";
}
$fwViewData['msg'] = $msg;


$fwViewData['title'] = $MODULE_PLURAL;
$_SESSION['cbs'] = $cbs;
$fwViewData['busness_types'] = $tablebusness_types->getRows();