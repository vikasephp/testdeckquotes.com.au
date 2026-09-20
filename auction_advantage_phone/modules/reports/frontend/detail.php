<?php 
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$user_id = $_SESSION['user']['user_id'];
$reportgen = $fwRequest->getParam('reportgen', '');
        $tableUsers = new Fw_Db_Table('users');
        
        $curusergroup = array_keys($_SESSION['user']['::groups::']);
        if($curusergroup[0] !== 'Administrators')
        {$fwViewData['usergroup'] = $curusergroup[0]; $where = " WHERE ur_user_id = ".$user_id;}
        
        if($reportgen)
        {  
        $report_type =  $fwRequest->getParam('report_type', 1);
        $gen_user_id =  $fwRequest->getParam('gen_user_id', $user_id);
        $report_filters = $fwRequest->getParam('report_filter', 0);
        
        if($report_type == 3)
        {
        $toDate =  $fwRequest->getParam('from_date', '');
        $fromDate =  $fwRequest->getParam('to_date', '');
        }	
        
        if($report_filters > 0)
        {
        ////filter////
        if($gen_user_id == 'all'){generate_all_users_filter_production_report($report_type, $report_filters, $toDate, $fromDate);
        }
        else{generate_singel_user_filter_production_report($gen_user_id, $report_type, $report_filters, $toDate, $fromDate);}
        ////filter////
        }else{
        if($gen_user_id == 'all')
        {
        generate_All_user_production_report($report_type, $toDate, $fromDate);			
        }else{
        generate_singel_user_production_report($gen_user_id, $report_type , $toDate, $fromDate);
        }
        }		
        $fwViewData['message'] = "Report has been successfully generated.";
        }
        $Usersql = "SELECT u.*,ug.group_id, g.group_name
        FROM users u, groups g, users_groups ug
        where u.user_id=ug.user_id AND ug.group_id=g.group_id AND g.group_id != 2 ORDER By g.group_id ASC, u.user_name ASC"; 
        $fwViewData['users'] = $fwDb->query($Usersql);
        $fwViewData['title'] = 'Generate Production Report';