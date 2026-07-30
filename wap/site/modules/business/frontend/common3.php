<?php
$fwMainView = 'file:' . getcwd() . '/common3.tpl';
$fwViewData['calcjs'] ='file:' . getcwd() . '/calcjs.tpl';
$requset = $fwRequest->getparamget('a_req', '');
$editrequset = $fwRequest->getparamget('e_req', '');

$iPad    = stripos($_SERVER['HTTP_USER_AGENT'],"iPad");
$fwViewData['ipad'] = $iPad;

if($requset)
{
   switch ($requset) {


		case 'showdocuments_fin':
			$bus_id = $fwRequest -> getParamget('bus_id','');
			$divid = $fwRequest -> getParamget('divid','');
			$pagenum = $fwRequest -> getParamget('pagenum','');
			$perpage = $fwRequest -> getParamget('docperpage','');
			
			//db("Testing");
			//exit;
			if($bus_id>0)
			{
				$sql = "SELECT bd.*, u.user_name FROM business_documents_finance as bd
						LEFT JOIN users as u ON bd.bd_user_id = u.user_id
						WHERE bd.bd_bsi_id = $bus_id AND bd.bd_doc_inner = 0
						ORDER BY bd.bd_id DESC";
						
				$detail = $fwDb -> query($sql);
				/*************** Begin Pagination *****************/
				$userData = $detail;
			if(!empty($userData))
							{
							
							if (!(isset($pagenum)))
								{
									$pagenum = 1;
								} 
							
								$rows = count($userData);
								
								if($perpage>0)
								{
									$page_rows = $perpage;
								}
								else
								{
									$page_rows = 5;
								}
								
								$fwViewData['perpage'] =  $page_rows;
								
								
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
							if($sql2){$new_detail= $fwDb->query($sql2);}
							  $count_detail = count($new_detail);
							for($i=0; $i<$count_detail; $i++)
								{
									if($new_detail[$i]['bd_uploaded_date']!=0)
									{
										$new_detail[$i]['bd_uploaded_date'] = changedate_d_m_Y($new_detail[$i]['bd_uploaded_date'])." ".changetime_h_m($new_detail[$i]['bd_uploaded_date']);	
									}
									else
									{
										$new_detail[$i]['bd_uploaded_date'] = '';
									}
								}
							  $fwViewData['documents_data_fin'] = $new_detail;
							}
			/*************** End Pagnation ********************/
				$fwViewData['documents_data_show_fin'] = "Show";
								$fwViewData['divid'] = $divid;
								
				
			}
		break;

		case 'documents_fin':
		
			$fwViewData['showDocumentsIframe_fin'] = 1;
			$bus_id = $fwRequest -> getParamget('bus_id','');
			$divid = $fwRequest -> getParamget('divid','');
			$tableid = $fwRequest -> getParamget('tableid','');
			$fwViewData['bus_id'] = $bus_id;
			$fwViewData['divid'] = $divid;
			
			
			if($tableid>0)
			{
				$sql = "SELECT bd.*, c.customer_name FROM business_documents_finance as bd
						LEFT JOIN customers as c ON bd.bd_user_id = c.user_id
						WHERE bd.bd_id = $tableid ";
						
				$detail = $fwDb -> queryOne($sql);
				$fwViewData['detail'] = $detail;
			}			
			$business_documentsTable = new Fw_Db_Table('business_documents_finance');
			$subDocument = $fwRequest -> getParam('subDocument','');
			
			if(!empty($subDocument))
			{
				$data = $fwRequest -> getParam('data',array());
				
								
				if(!$data['bd_upload_dossier']){$data['bd_upload_dossier'] = $data['bd_upload_dossier'] = 0;}
				
				$document = $_FILES['document'];

				
				if($_FILES['document']['error'] == 0)
						{
							$docfile = $_FILES['document']['name'];
							$file_type = $_FILES['document']['type'];
							
							$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
							$src = $_FILES['document']['tmp_name'];
							$destination = BASE_DIR.FILE_PATH.'files/business_documents/'.$docfile;
								
							if(file_exists($destination))
								{
									$file_exist_error = 1;
								}	
							else
							{
								if (!move_uploaded_file($src, $destination))
								{
									echo "Possible file upload attack";
								}
								else
								{
									unset($data['bd_doc_name']);
									$data['bd_doc_name'] = $docfile;
									chmod($destination, 0664);
								}
							}	
						}

			if(empty($file_exist_error))	
				{	
					if(!empty($data['bd_doc_name']))
					{
						
						if(!empty($data['bd_id']) AND $data['bd_id']>0)
						{
							$bd_id = $data['bd_id'];
							unset($data['bd_id']);
							$business_documentsTable -> setWhere("bd_id = $bd_id");
							$business_documentsTable -> updateRow($data);
							$success_msg = "Document Updated Successfully.";
						}
						else
						{
							$user_name = $_SESSION['user']['user_name'];
							
							//db($data);
							if(!empty($data['bd_cover_letter_date']))
							{
								$data['bd_cover_user'] = $user_name;	
								$data['bd_cover_letter_date'] = changedate_y_m_d($data['bd_cover_letter_date']);
							}
							if(!empty($data['bd_emailed_client_date']))
							{
								$data['bd_emailed_user'] = $user_name;
								$data['bd_emailed_client_date'] = changedate_y_m_d($data['bd_emailed_client_date']);	
							}
							if(!empty($data['bd_posted_client_date']))
							{
								$data['bd_posted_user'] = $user_name;	
								$data['bd_posted_client_date'] = changedate_y_m_d($data['bd_posted_client_date']);
							}
							
							$data['bd_user_id'] = $_SESSION['user']['user_id'];
							$data['bd_uploaded_date'] = date('Y-m-d H:i');
							$business_documentsTable -> insertRow($data);
							$success_msg = "Document Added Successfully.";
						}
						
						$fwViewData['success_msg'] = $success_msg;
						$fwViewData['showDocumentsIframe_fin'] = '0';
					}
					else
					{
						$fwViewData['file_exist'] = "Document is mandatory. Please select the file.";
						$fwViewData['showDocumentsIframe_fin'] = 1;
					}
				}
				else
				{
					$fwViewData['detail'] = $data;
					$fwViewData['file_exist'] = "A file already exists with this filename. Please Rename the file and Upload it again.";
					$fwViewData['showDocumentsIframe_fin'] = 1;
				}
			}
		break;
		
		case 'intdocuments_fin':
		
			$fwViewData['showDocumentsIframe_fin'] = 1;
			$bus_id = $fwRequest -> getParamget('bus_id','');
			$divid = $fwRequest -> getParamget('divid','');
			$tableid = $fwRequest -> getParamget('tableid','');
	
			$fwViewData['bus_id'] = $bus_id;
			$fwViewData['divid'] = $divid;
			
			
			if($tableid>0)
			{
				$sql = "SELECT bd.*, c.customer_name FROM business_documents_finance as bd LEFT JOIN customers as c ON bd.bd_user_id = c.user_id WHERE bd.bd_id = $tableid";
						
				$detail = $fwDb -> queryOne($sql);
				$fwViewData['detail'] = $detail;

			}
						
			$business_documentsTable = new Fw_Db_Table('business_documents_finance');
			$subDocument = $fwRequest -> getParam('subDocument','');
			$fwViewData['inrenaldocuments_fin'] = "inrenaldocuments_fin";	
			if(!empty($subDocument))
			{
				$data = $fwRequest -> getParam('data',array());
				if(!$data['bd_upload_dossier']){$data['bd_upload_dossier'] = $data['bd_upload_dossier'] = 0;}
				
				$document = $_FILES['document'];
				if($_FILES['document']['error'] == 0)
						{
							$docfile = $_FILES['document']['name'];
							$file_type = $_FILES['document']['type'];
							
							$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
							$src = $_FILES['document']['tmp_name'];
							$destination = BASE_DIR.FILE_PATH.'files/business_documents/'.$docfile;
								
							if(file_exists($destination))
								{
									$file_exist_error = 1;
								}	
							else
							{
								if (!move_uploaded_file($src, $destination))
								{
									echo "Possible file upload attack.";
								}
								else
								{
									unset($data['bd_doc_name']);
									$data['bd_doc_name'] = $docfile;
									chmod($destination, 0664);
								}
							}	
						}
					
			
			if(empty($file_exist_error))	
				{	
					if(!empty($data['bd_doc_name']))
					{
						$data['bd_user_id'] = $_SESSION['user']['user_id'];
						$data['bd_uploaded_date'] = date('Y-m-d H:i');
	
						if(!empty($data['bd_id']) AND $data['bd_id']>0)
						{
							$bd_id = $data['bd_id'];
							unset($data['bd_id']);
							
							$business_documentsTable -> setWhere("bd_id = $bd_id");
							$business_documentsTable -> updateRow($data);
							$success_msg = "Document Updated Successfully.";
						}
						else
						{
							$business_documentsTable -> insertRow($data);
							$success_msg = "Document Added Successfully.";
						}
						
						$fwViewData['success_msg'] = $success_msg;
						$fwViewData['showDocumentsIframe_fin'] = '0';
					}
					else
					{
						$fwViewData['file_exist'] = "Document is mandatory. Please upload the Document.";
						$fwViewData['showDocumentsIframe_fin'] = 1;
					}
				}
				else
				{
					$fwViewData['detail'] = $data;
					$fwViewData['file_exist'] = "A file already exists with this filename. Please Rename the file and Upload it again.";
					$fwViewData['showDocumentsIframe_fin'] = 1;
				}
			}
		break;
		
		case 'delete_document_fin':
		
			$tableid = $fwRequest -> getParamget('tableid','');
			$id = $fwRequest -> getParamget('id','');
			
			$sql = "DELETE FROM business_documents_finance WHERE bd_id = $tableid";
			$temp = $fwDb->queryOne($sql);
			
			echo "$id||Document deleted successfully.";
			exit;
			
		break;
		
		
		case "DocumentCheckList_fin":
		
			$document_check_listTable = new Fw_Db_Table('document_check_list_finance');
			$admin_document_check_listTable = new Fw_Db_Table('admin_document_check_list_financial');
			
			$addList = $fwRequest -> getParamget('addList','');
			$bus_id = $fwRequest -> getParamget('bus_id','');
		
		if(!empty($addList) AND $addList == 'add')
		{
			if($bus_id>0)
			{
					$businessTable = new Fw_Db_Table('business');
					$businessTable->setWhere('bsn_id =' .$bus_id);
					$pt_data = $businessTable->getRow();
					$pt_data1 = $pt_data['bsn_type'];
								
					$admin_document_check_listTable -> setWhere("admin_doc_status = 1 AND admin_doc_proj_type LIKE '%".$pt_data1."%'");
					$admin_document_check_listTable -> setOrderBy('admin_doc_order ASC');
					$data_checklist = $admin_document_check_listTable -> getRows();
				
					$fwViewData['data_checklist'] = $data_checklist;
						
					foreach($data_checklist as $k => $v)
					{
						$data['doc_bsn_id'] = $bus_id;
						$data['doc_name_id'] = $v['admin_doc_id'];
						$data['doc_upload_to_dossier'] = $v['admin_doc_upload_to_dossier'];
						$document_check_listTable->setWhere("doc_name_id =".$v['admin_doc_id'] .' AND doc_bsn_id = '.$bus_id);
							if(!$document_check_listTable->rowExists())
							{
							$document_check_listTable -> insertRow($data);
							}					
					}
					
					$checkListErrorMsg = "Document Checklist has been added successfully.";
					$fwViewData['checkListErrorMsg'] = $checkListErrorMsg;
			}
			else
			{
				$fwViewData['checkListErrorMsg'] = 'Business Id is not available. Please save the business and then try again.';
			}
		}
		
		if($bus_id>0)
		{

							
			$sql_print_data =  "SELECT dcl.*, adcl.*, u.user_name 
								FROM document_check_list_finance as dcl
								INNER JOIN admin_document_check_list_financial as adcl
								ON dcl.doc_name_id = adcl.admin_doc_id
								LEFT JOIN users as u
								ON dcl.doc_user_name = u.user_id
								inner join business as bs 
							on (adcl.admin_doc_proj_type LIKE '%".$pt_data1."%') and bs.bsn_id=".$bus_id." 
								WHERE dcl.doc_bsn_id = $bus_id ORDER BY adcl.admin_doc_order ASC";					
								
							
			$print_data = $fwDb -> query($sql_print_data);
			
							
			$count_print_data = count($print_data);
			for($i=0; $i<$count_print_data; $i++)
			{
				if($print_data[$i]['doc_date_uploaded']!=0)
				{
				$print_data[$i]['doc_date_uploaded'] = changedate_d_m_Y($print_data[$i]['doc_date_uploaded'])." ".changetime_h_m($print_data[$i]['doc_date_uploaded']);	
				}
				else
				{
				$print_data[$i]['doc_date_uploaded'] = '';
				}
			}
			$fwViewData['print_data_fin'] = $print_data;
		}		


		break;
		
		
		case "checklist_fin":
			$fwViewData['iframe_data_fin'] = 1;

			$doc_id = $fwRequest -> getParamget('doc_id','');
				
			if(!empty($doc_id))
			{
					$sql_edit_data = "SELECT dcl.*, adcl.*, u.user_name FROM document_check_list_finance as dcl
							INNER JOIN admin_document_check_list_financial as adcl ON dcl.doc_name_id = adcl.admin_doc_id
							LEFT JOIN users as u ON dcl.doc_user_name = u.user_id
							WHERE dcl.doc_id = $doc_id";
		
				$doc_data = $fwDb->queryOne($sql_edit_data);
							
				if($doc_data['doc_date_uploaded']!=0)
				{
					$doc_data['doc_date_uploaded'] = changedate_d_m_Y($doc_data['doc_date_uploaded'])." ".changetime_h_m($doc_data['doc_date_uploaded']);	
				}
				else
				{
					$doc_data['doc_date_uploaded'] = '';
				}
				
				$fwViewData['doc_data'] = $doc_data;

				//******* Begin Store value in DB after submit*********//
				$submit_iframe = $fwRequest -> getParam('submit_iframe','');
				if(!empty($submit_iframe))
				{
					
					
				ini_set('display_errors', 'On');
					$doc = $fwRequest -> getParam('doc','');

						if($_FILES['image']['error'] == 0)
						{
							$docfile = $_FILES['image']['name'];
							$file_type = $_FILES['image']['type'];
							
							$datetime = trim(date('d_m_Y_H_i_'),'0');
							$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
							$src = $_FILES['image']['tmp_name'];
							$destination = BASE_DIR.FILE_PATH. 'files/document_check_list_files/'.$docfile;
										
							if (!move_uploaded_file($src, $destination))
							{
								echo "Possible file upload attack";
							}
							else
							{
								$doc['doc_file_name']= $docfile;
								$doc['doc_user_name'] = $_SESSION['user']['user_id'];
								$doc['doc_date_uploaded'] = date('Y-m-d H:i');
								chmod($destination, 0664);
							}
						}
						
						if(empty($doc['doc_file_name']) AND !empty($doc['doc_file_name_temp']))
						{
							$doc['doc_file_name'] = $doc['doc_file_name_temp'];
							unset($doc['doc_file_name_temp']);
							
						}
						elseif(empty($doc['doc_file_name']))
						{
							$doc['doc_file_name'] = '';
							$doc['doc_date_uploaded']='';
							$doc['doc_user_name']='';
						}
						
						
						if(empty($doc['doc_upload_to_dossier']))
						{
							$doc['doc_upload_to_dossier'] = 0;
						}
						
						if(empty($doc['doc_not_avail']))
						{
							$doc['doc_not_avail'] = 0;
						}
						

						$doc_id = $doc['doc_id'];
						unset($doc['doc_id']);
						unset($doc['doc_file_name_temp']);
						$document_check_listTable = new Fw_Db_Table('document_check_list_finance');
						$document_check_listTable -> setWhere("doc_id = $doc_id");
						$document_check_listTable -> updateRow($doc);
						$fwViewData['iframe_data_fin'] = 0;
						$fwViewData['iframe_msg'] = '1';		
										
				}
				//******* End Store value in DB after submit*********//
			}
		break;		
		
		case "PurchaseOrder":
			$document_check_listTable = new Fw_Db_Table('purchase_order');
			$admin_document_check_listTable = new Fw_Db_Table('poincc_component');
			$addList = $fwRequest -> getParamget('addList','');
			$b = $fwRequest -> getParamget('b','');
			$bus_id = $fwRequest -> getParamget('bus_id','');
			
		if(!empty($addList) AND $addList == 'add')
		{
			if($bus_id>0)
			{
				$businessTable = new Fw_Db_Table('business');
				$businessTable->setWhere('bsn_id =' .$bus_id);
				$pt_data = $businessTable->getRow();
				$pt_data1 = $pt_data['bsn_type'];
					

				$data_checklist = $admin_document_check_listTable -> getRows();
					
				$fwViewData['data_checklist'] = $data_checklist;
						
				foreach($data_checklist as $k => $v)
				{
				$data['po_bsn_id'] = $bus_id;
				$data['po_component_id'] = $v['pc_id'];
			
				$document_check_listTable->setWhere("po_component_id =".$v['pc_id'] .' AND po_bsn_id = '.$bus_id);
					if(!$document_check_listTable->rowExists())
					{
					$document_check_listTable -> insertRow($data);
					}					
				}
					
					$checkListErrorMsg = "Document Checklist has been added successfully.";
					$fwViewData['checkListErrorMsg'] = $checkListErrorMsg;
			}
			else
			{
				$fwViewData['checkListErrorMsg'] = 'Business Id is not available. Please save the business and then try again.';
			}
		}
		
		if($bus_id>0)
		{
			
			$pr_link = "Select tl_link from top_links where tl_slug = 'purchase_order' ";
			$prdata = $fwDb->queryOne($pr_link);
			$fwViewData['proc_link'] = $prdata['tl_link'];
			
			
			if($b =='NR') {	
			$sql_print_data = "SELECT purchase_order . * , poincc_component . *
					FROM `purchase_order`
					INNER JOIN poincc_component ON purchase_order.po_component_id = poincc_component.pc_id
					WHERE purchase_order.po_bsn_id =  " .$bus_id ;
			$sql_custom = "SELECT purchase_order_custom.* from purchase_order_custom
					WHERE purchase_order_custom.po_bsn_id =  " .$bus_id ;		
					
			} elseif($b =='AI') {
			$sql_print_data = "SELECT purchase_order . * , poincc_component . *
					FROM `purchase_order`
					INNER JOIN poincc_component ON purchase_order.po_component_id = poincc_component.pc_id
					WHERE purchase_order.po_bsn_id =  " .$bus_id . " and purchase_order.po_quote_accepted > 0 ";
						
			$sql_custom =  "SELECT purchase_order_custom.* from purchase_order_custom
					WHERE purchase_order_custom.po_bsn_id =  " .$bus_id . " 
					and purchase_order_custom.po_quote_accepted > 0 ";	
				
			} elseif($b =='PI') {
			$sql_print_data = "SELECT purchase_order . * , poincc_component . *
					FROM `purchase_order`
					INNER JOIN poincc_component ON purchase_order.po_component_id = poincc_component.pc_id
					WHERE purchase_order.po_bsn_id =  " .$bus_id . " and purchase_order.po_quote_accepted = 0 ";
						
			$sql_custom = "SELECT purchase_order_custom.* from purchase_order_custom
					WHERE purchase_order_custom.po_bsn_id =  " .$bus_id . " 
					and purchase_order_custom.po_quote_accepted = 0 ";		
				
			}
			else {	
			$sql_print_data = "SELECT purchase_order . * , poincc_component . *
					FROM `purchase_order`
					INNER JOIN poincc_component ON purchase_order.po_component_id = poincc_component.pc_id
					WHERE purchase_order.po_bsn_id =  " .$bus_id . " and purchase_order.po_relevant = 0 ";
					
			$sql_custom = "SELECT purchase_order_custom.* from purchase_order_custom
					WHERE purchase_order_custom.po_bsn_id =  " .$bus_id . " 
					and purchase_order_custom.po_relevant = 0 ";		
			}
			
			$print_data = $fwDb->query($sql_print_data);
			$fwViewData['print_data'] = $print_data;
			$fwViewData['show_quote'] = "1";
			
			
			$print_data_custom = $fwDb->query($sql_custom);
			$fwViewData['print_data_custom'] = $print_data_custom;
			
		}		

              break;

	      case "purchase":
	      
			$fwViewData['iframe_data_pur'] = 1;



			$po_id = $fwRequest -> getParamget('po_id','');
			
			
				
			if(!empty($po_id))
			{
//				
		
				$sql_edit_data = "SELECT purchase_order.* , poincc_component.*
					          FROM purchase_order
					         INNER JOIN poincc_component ON purchase_order.po_component_id = poincc_component.pc_id
					         WHERE purchase_order.po_id =  " .$po_id;
		
				$doc_data = $fwDb->queryOne($sql_edit_data);
				
			
							
				if($doc_data['doc_date_uploaded']!=0)
				{
					$doc_data['doc_date_uploaded'] = changedate_d_m_Y($doc_data['doc_date_uploaded'])." ".changetime_h_m($doc_data['doc_date_uploaded']);	
				}
				else
				{
					$doc_data['doc_date_uploaded'] = '';
				}
				
				$fwViewData['doc_data'] = $doc_data;

				//******* Begin Store value in DB after submit*********//
				$submit_iframe_pur = $fwRequest -> getParam('submit_iframe_pur','');
				
				
				if(!empty($submit_iframe_pur))
				{

				       ini_set('display_errors', 'On');
					$doc = $fwRequest -> getParam('doc','');
					
						if($_FILES['quote1']['error'] == 0)
						{
							$docfile = $_FILES['quote1']['name'];
							$file_type = $_FILES['quote1']['type'];
							
							$datetime = trim(date('d_m_Y_H_i_'),'0');
							$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
							$src = $_FILES['quote1']['tmp_name'];
							$destination = BASE_DIR.FILE_PATH. 'files/purchase_order_quote/'.$docfile;
										
							if (!move_uploaded_file($src, $destination))
							{
								echo "Possible file upload attack";
							}
							else
							{
								$doc['po_quote1']= $docfile;
								$doc['doc_user_name'] = $_SESSION['user']['user_id'];
								$doc['doc_date_uploaded'] = date('Y-m-d H:i');
								chmod($destination, 0664);
							}
						}
						
						if($_FILES['quote2']['error'] == 0)
						{
							$docfile2 = $_FILES['quote2']['name'];
							$file_type = $_FILES['quote2']['type'];
							
							$datetime = trim(date('d_m_Y_H_i_'),'0');
							$docfile2 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile2);
							$src = $_FILES['quote2']['tmp_name'];
							$destination = BASE_DIR.FILE_PATH. 'files/purchase_order_quote/'.$docfile2;
										
							if (!move_uploaded_file($src, $destination))
							{
								echo "Possible file upload attack";
							}
							else
							{
								$doc['po_quote2']= $docfile2;
								$doc['doc_user_name'] = $_SESSION['user']['user_id'];
								$doc['doc_date_uploaded'] = date('Y-m-d H:i');
								chmod($destination, 0664);
							}
						}
						

						if($_FILES['quote3']['error'] == 0)
						{
							$docfile3 = $_FILES['quote3']['name'];
							$file_type = $_FILES['quote3']['type'];
							
							$datetime = trim(date('d_m_Y_H_i_'),'0');
							$docfile3 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile3);
							$src = $_FILES['quote3']['tmp_name'];
							$destination = BASE_DIR.FILE_PATH. 'files/purchase_order_quote/'.$docfile3;
										
							if (!move_uploaded_file($src, $destination))
							{
								echo "Possible file upload attack";
							}
							else
							{
								$doc['po_quote3']= $docfile3;
								$doc['doc_user_name'] = $_SESSION['user']['user_id'];
								$doc['doc_date_uploaded'] = date('Y-m-d H:i');
								chmod($destination, 0664);
							}
						}
						
						
						$po_id = $doc['po_id'];
						unset($doc['po_id']);
						//unset($doc['doc_file_name_temp']);
						$purchase_order_Table = new Fw_Db_Table('purchase_order');
						$purchase_order_Table -> setWhere("po_id = $po_id");
						$purchase_order_Table -> updateRow($doc);
						$fwViewData['iframe_data_pur'] = 0;
						$fwViewData['iframe_msg_pur'] = '1';		
										
				}
				//******* End Store value in DB after submit*********//
			}
		break;


		
}



}