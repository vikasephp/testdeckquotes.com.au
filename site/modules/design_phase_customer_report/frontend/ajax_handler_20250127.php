 <?php
 $postedData = $_POST;
  $response = ['status'=> false,'errorList'=>[],'success'=>true,'action'=> '', 'data'=>[] ];
 if( !empty($postedData['action']) &&  $postedData['action'] == 'update_bsn_projecttype' )
   {
       $record_id = $postedData['r_ID'];  $project_type	 = $postedData['project_type'];
        if( !empty($record_id) )
       {
            $tablebar = new Fw_Db_Table('business'); $update_data['project_type'] = $project_type;
            $tablebar->setWhere("bsn_id = ".$record_id );  $result = $tablebar->updateRow($update_data);
            
             $matsql = "SELECT  business.bsn_id,business.project_type, business.bsn_name from business where bsn_id = ".$record_id;

            if($matsql){
                $userData = $fwDb->query($matsql);
                
                foreach($userData as $k=>$v)
                {
                	   $project_type = trim($v['project_type']); $bsn_name = trim($v['bsn_name']);
                	   $bsn_name_arr = explode("-",$bsn_name); 
                		if(!empty($project_type))
                		{
                		     if(count($bsn_name_arr) >= 2 ){
                		     $userData[$k]['bsn_name'] = $project_type." - ".$bsn_name_arr[1];
                		     }
                		     else
                		     {
                		         $userData[$k]['bsn_name'] = $project_type." - ".$bsn_name; 
                		     }
                		}
                }
		
            }

			if($result){ $response = ['status'=> true ,'errorList'=>[],'stage'=>"if",'success'=>true,"user_data" => $userData, 'data'=>[] ]; }
			else { $response = ['status'=> false,'errorList'=>[],'stage'=>"else",'success'=> "",'data'=>[] ]; }
       }
       else
       {
           $response = ['status'=> false,'errorList'=>[],'success'=>true,'stage'=>"else T",'action'=> 'update_mergeplan_date', 'data'=>[] ];
       }
       
   }
   
   
    if( !empty($postedData['action']) &&  $postedData['action'] == 'update_checklist_on_off' )
   {
       $record_id = $postedData['r_ID'];  $activeStatus	 = $postedData['activeStatus'];
        if( !empty($record_id) )
       {
            $tablebar = new Fw_Db_Table('document_proposal_name'); $update_data['checklist_status'] = $activeStatus;
            $tablebar->setWhere("dpn_id = ".$record_id );  $result = $tablebar->updateRow($update_data);

			if($result){ $response = ['status'=> true ,'errorList'=>[],'stage'=>"if",'success'=>true, 'data'=>[] ]; }
			else { $response = ['status'=> false,'errorList'=>[],'stage'=>"else",'success'=> "",'data'=>[] ]; }
       }
       else
       {
           $response = ['status'=> false,'errorList'=>[],'success'=>true,'stage'=>"else T",'action'=> 'update_checklist_on_off', 'data'=>[] ];
       }
       
   }

  echo json_encode($response); exit;
   
?>