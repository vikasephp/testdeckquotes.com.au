<?php 
$fwMainView = 'file:' . getcwd() . '/common.tpl';
$requset = $fwRequest->getparamget('a_req', '');

	if($requset):

				switch ($requset):
				case 'getleads':
				$pagenum = $fwRequest->getparamget('pagenum','');
				$id = $fwRequest->getparamget('id', 0);
				$tableES = new Fw_Db_Table("enquirysource");
				$tableES->setWhere("soe_id = ".$id);
				$fwViewData['soe_data'] = $tableES->getRow();
				$order = " ORDER BY business.bsn_name ASC";
				if($id > 0){$where = " AND enquirysource.soe_id = ".$id;}
				
				$sql = "SELECT bus_customers.*, customers_status.*, customers_type.*, byer_enquiry.*,  business.bsn_id, business.bsn_name, enquirysource.*
			FROM bus_customers 
			LEFT JOIN customers_status ON bus_customers.bcust_status = customers_status.cs_id 
			LEFT JOIN customers_type ON bus_customers.bcust_type = customers_type.ct_id  
			Right JOIN byer_enquiry ON byer_enquiry.be_customer_id = bus_customers.bcust_id  
			LEFT JOIN business ON byer_enquiry.be_business_id = business.bsn_id 
			LEFT JOIN enquirysource ON enquirysource.soe_id = byer_enquiry.be_source_of_enquiry WHERE 1=1 ".$where.$order; 
				
				break;
				
				default:
				$search = $fwRequest->getparam($TABLE, '');
		
				$order = " ORDER BY business.bsn_name ASC";
		   if($search):	
				if($search['lead_type'] > 0): $where = " AND enquirysource.soe_id = ".$search['lead_type'];	endif;
				if($search['lead_status'] > 0): $where .= " AND byer_enquiry.be_status = ".$search['lead_status'];	endif;			
				if($search['lead_project']): $where .= " AND business.bsn_name LIKE '%{$search['lead_project']}%'";	endif;	
				
				if($search['be_created_date_start'] && !$search['be_created_date_end']): $where .= " AND byer_enquiry.be_created_date >= '{$search['be_created_date_start']}'"; 	
				elseif($search['be_created_date_end'] && !$search['be_created_date_start']): $where .= " AND byer_enquiry.be_created_date <= '{$search['be_created_date_end']}'";	
				elseif($search['be_created_date_start'] && $search['be_created_date_end']): 
				$where .= " AND byer_enquiry.be_created_date BETWEEN '{$search['be_created_date_start']}' AND '{$search['be_created_date_end']}'";
				
				endif;	
				

				if($search['lead_cust']):  list($fname, $lname) = explode(" ", $search['lead_cust']);  
				if($fname): $where .= " AND (bus_customers.bcust_fname LIKE '%{$fname}%' OR bus_customers.bcust_lname LIKE '%{$fname}%')"; endif;
				if($lname): $where .= " OR (bus_customers.bcust_fname LIKE '%{$fname}%' OR bus_customers.bcust_lname LIKE '%{$lname}%')"; endif;
			
			endif;	
					
				endif;
			$sql = "SELECT bus_customers.*, customers_status.*, customers_type.*, byer_enquiry.*,  business.bsn_id, business.bsn_name, enquirysource.*
			FROM bus_customers 
			LEFT JOIN customers_status ON bus_customers.bcust_status = customers_status.cs_id 
			LEFT JOIN customers_type ON bus_customers.bcust_type = customers_type.ct_id  
			Right JOIN byer_enquiry ON byer_enquiry.be_customer_id = bus_customers.bcust_id  
			LEFT JOIN business ON byer_enquiry.be_business_id = business.bsn_id 
			LEFT JOIN enquirysource ON enquirysource.soe_id = byer_enquiry.be_source_of_enquiry WHERE 1=1 ".$where.$order; 	
			endswitch;	
endif;	


if($sql){$userData = $fwDb->query($sql);}
				
				if(!empty($userData))
				{
				if (!(isset($pagenum)))
					{
						$pagenum = 1;
					} 
				
					$rows = count($userData);
					
					$page_rows = 5;
					$last = ceil($rows/$page_rows); 
					
					if ($pagenum <= 1)
					{
						$pagenum = 1;
					}
					elseif ($pagenum > $last)
					{
						$pagenum = $last;
					}
					$fwViewData['last'] = $last;
					$fwViewData['lastone'] = $last-1;
					$fwViewData['lasttow'] = $last-2;
					$fwViewData['pagenum'] = $pagenum;
					$pagenatedatanext = $pagenum;
					$pagenatedataprev = $pagenum;
					for($i=0; $i<9; $i++)
						{
						$paginate[$pagenatedatanext] = $pagenatedatanext;
						$pagenatedatanext ++;
						}
						$fwViewData['paginatenext'] = $paginate;
					$pagenatedataprev = $pagenum;	
					for($i=0; $i<9; $i++)
						{
						$paginateprev[$pagenatedataprev] = $pagenatedataprev;
						$pagenatedataprev --;
						}
					$fwViewData['paginateprev'] = array_reverse($paginateprev);
					
					$max = 'limit ' .($pagenum - 1) * $page_rows .',' .$page_rows;
					
					$sql2 =  $sql." ".$max;
				
				if($sql2){$fwViewData['list']= $fwDb->query($sql2);}
				}