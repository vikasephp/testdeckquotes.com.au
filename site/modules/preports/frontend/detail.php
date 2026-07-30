<?php 
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$user_id = $_SESSION['user']['user_id'];
$reportgen = $fwRequest->getParam('reportgen', '');
$tableUserreport =  new Fw_Db_Table('user_reports');
$tableprojecttype = new Fw_Db_Table('project_type');
$tablebusness_status = new Fw_Db_Table('busness_status'); 
 
 
         $tableUsers = new Fw_Db_Table('users');
        
        $curusergroup = array_keys($_SESSION['user']['::groups::']);
        if($curusergroup[0] !== 'Administrators'){$fwViewData['usergroup'] = $curusergroup[0]; $where = " WHERE ur_user_id = ".$user_id;}
        
			if($reportgen)
			{  
			$report_type =  $fwRequest->getParam('report_type', 1);
			$project_type =  $fwRequest->getParam('project_type', 0);
			$project_status =  $fwRequest->getParam('project_status', 0);
			$ur_type = $fwRequest->getParam('ur_type', 0);
			
			
			$gen_user_id =  $fwRequest->getParam('gen_user_id', 0);
			$report_filters = $fwRequest->getParam('report_filter', 0);
			
				if($ur_type == 2)
					{
					$toDate =  $fwRequest->getParam('from_date', '');
					$fromDate =  $fwRequest->getParam('to_date', '');
					$deffdate = daysDifference($fromDate, $toDate);
					$data['ur_start_date'] = changedate_y_m_d($fromDate);
					$data['ur_end_date'] = changedate_y_m_d($toDate);
					}	
				if($project_status > 0)
					{
						$tablebusness_status->setWhere("st_id = {$project_status}");				
						$stdata = $tablebusness_status->getRow();
					}
				$reporttype = (($stdata['st_name']) ? $stdata['st_name']." ": "")."Project Daily Task Summary";

				if($project_type == 6):
				$rfile = Convert_Project_Daily_Task_Summary_kithome($reporttype, $project_type, $project_status, $gen_user_id, $deffdate);
				else:
				$rfile = Convert_Project_Daily_Task_Summary($reporttype, $project_type, $project_status, $gen_user_id, $deffdate);
				endif;
				$data['ur_user_id'] = $user_id;
				$data['ur_type'] = $ur_type;
				$data['ur_report_name'] = $rfile;
				$data['ur_feature'] = $reporttype;
				$tableUserreport->insertRow($data);	
				
				
			$fwViewData['message'] = "Report has been successfully generated.";
			}
		
        $Usersql = "SELECT u.*,ug.group_id, g.group_name
        FROM users u, groups g, users_groups ug
        where u.user_id=ug.user_id AND ug.group_id=g.group_id AND g.group_id != 2 ORDER By g.group_id ASC, u.user_name ASC"; 
        $fwViewData['users'] = $fwDb->query($Usersql);
		
$tableprojecttype->setWhere("pt_status = 1");		
$fwViewData['ptypes'] = $tableprojecttype->getRows();
$tablebusness_status->setWhere("st_status = 1");		
$fwViewData['pstatus'] = $tablebusness_status->getRows();		
$fwViewData['title'] = 'Project Tasks Reports';