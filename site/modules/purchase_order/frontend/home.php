<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');

$table_toplink = new Fw_Db_Table('top_links');

$update_link = $fwRequest->getParam('update_link', '');
if(!empty($update_link)){
	$proc = $fwRequest->getParam('proc', '');
        $tlDetail['tl_link'] = $proc;
	$table_toplink->setWhere("tl_slug = 'purchase_order'");
	$table_toplink->updateRow($tlDetail);
}


$where = " WHERE purchase_order.po_quote_accepted = 1 OR length(purchase_order.po_component_name) > 0";
$where2 = " WHERE purchase_order_custom.po_quote_accepted = 1 ";
$fwViewData['ran'] =  rand(100000,999999);

$TABLE = 'purchase_order';


$clear = $fwRequest->getParam('clear', '');

if(!empty($clear)) {
	unset($_SESSION['keyword']);
	unset($keyword);
	$fwViewData['keyword']='';	
}
	
if($keyword):
$where .= " AND ( business.bsn_address LIKE '%".$keyword."%'
            OR purchase_order.po_supplier1 LIKE '%".$keyword."%' )";
	
	    $_SESSION['keyword'] = $keyword;
	    $fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword'] && $pagenum > 0):

$where .= " AND (business.bsn_address LIKE '%".$_SESSION['keyword']."%' 
            OR purchase_order.po_supplier1 LIKE '%".$_SESSION['keyword']."%') ";	
	
	    $fwViewData['keyword']=$_SESSION['keyword'];
endif;
 


//if($keyword):
//$where2 .= " AND ( business.bsn_address LIKE '%".$keyword."%'
//            OR purchase_order_custom.po_supplier1 LIKE '%".$keyword."%' )";
//	
//	    $_SESSION['keyword'] = $keyword;
//	    $fwViewData['keyword']=$_SESSION['keyword'];
//
//elseif($_SESSION['keyword'] && $pagenum > 0):
//
//$where2 .= " AND (business.bsn_address LIKE '%".$_SESSION['keyword']."%' 
//            OR purchase_order_custom.po_supplier1 LIKE '%".$_SESSION['keyword']."%') ";	
//	
//	    $fwViewData['keyword']=$_SESSION['keyword'];
//endif;
 



  
if(empty($pagenum))
	{
	unset($_SESSION['last_tdsql']);
	}
		
$sql = "SELECT  business.bsn_id, business.bsn_address, purchase_order.*   from purchase_order 		
	Left Join business ON purchase_order.po_bsn_id =  business.bsn_id 
	 " . $where . " Order By po_id DESC";

//db($sql);
$userData = $fwDb->query($sql);
//db($userData);

$k2 = count($userData);

$sql_custom = "SELECT  business.bsn_id, business.bsn_address, purchase_order_custom.*   from purchase_order_custom 		
	       Inner Join business ON purchase_order_custom.po_bsn_id =  business.bsn_id 
	      " . $where2;

$customData = $fwDb->query($sql_custom);


if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 300;
    $last = ceil($rows/$page_rows); 

    if ($pagenum <= 1)
    {
        $pagenum = 1;
    }
    elseif ($pagenum > $last)
    {
        $pagenum = $last;
    }
	$numstartvounter =  $page_rows * ($pagenum-1) + 1;
	$fwViewData['numstartvounter'] = $numstartvounter;
		
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


  
 $setdata = $fwDb->query($sql2);
 
 }
 
foreach($setdata as $k => $v)
{
		$sqla = "Select poincc_component.pc_name from poincc_component
			 where poincc_component.pc_id = ". $v['po_component_id'] ;
		$data = $fwDb->queryOne($sqla);
		
		$setdata2[$k]['po_id'] = $v['po_id'];
		$setdata2[$k]['bsn_id'] = $v['bsn_id'];
		
		if($v['bsn_id'] == 0) {
			$setdata2[$k]['bsn_address'] = "Non-project/Others";
		} else {
			$setdata2[$k]['bsn_address'] = $v['bsn_address'];	
		}
		$setdata2[$k]['pc_name'] = $data['pc_name'];
		$setdata2[$k]['po_supplier1'] = $v['po_supplier1'];
		$setdata2[$k]['po_quote_accepted'] = $v['po_quote_accepted'];
		
		$setdata2[$k]['po_quote1'] = $v['po_quote1'];

		$setdata2[$k]['po_value1'] = $v['po_value1'];
		$setdata2[$k]['po_alert'] = $v['po_alert'];
		
		$setdata2[$k]['po_sent_date'] = changedate_d_m_y($v['po_sent_date']);
		$setdata2[$k]['po_upload_date'] = changedate_d_m_y($v['po_upload_date']);
		$setdata2[$k]['po_linked_quote'] = $v['po_linked_quote'];
		$setdata2[$k]['po_component_name'] = $v['po_component_name'];
		$setdata2[$k]['po_purchase_order'] = $v['po_purchase_order'];
		
		$setdata2[$k]['po_po_number'] = $v['po_po_number'];
		$setdata2[$k]['po_approval'] = $v['po_approval'];
		$setdata2[$k]['po_quote_number'] = $v['po_quote_number'];
		$setdata2[$k]['po_delivery_event'] = $v['po_delivery_event'];
		
		$setdata2[$k]['po'] = 1;
		
		
}
 $k=$k+1;			
foreach($customData as $kc => $vc)
{
		$setdata2[$kc+$k]['po_id'] = $vc['po_id'];	
		$setdata2[$kc+$k]['bsn_id'] = $vc['bsn_id'];
		$setdata2[$kc+$k]['bsn_address'] = $vc['bsn_address'];
		$setdata2[$kc+$k]['pc_name'] = $vc['po_component_name'];
		$setdata2[$kc+$k]['po_supplier1'] = $vc['po_supplier1'];
		$setdata2[$kc+$k]['po_quote_accepted'] = $vc['po_quote_accepted'];
		$setdata2[$kc+$k]['po_quote1'] = $vc['po_quote1'];

		$setdata2[$k]['po_value1'] = $v['po_value1'];
		$setdata2[$kc+$k]['po_alert'] = $vc['po_alert'];
		
		
		$setdata2[$kc+$k]['po'] = 2;
}
		
	
 	$fwViewData['list'] =  $setdata2;

$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Purchase Order";
$table_toplink->setWhere("tl_slug = 'purchase_order'");
$fwViewData['proc_detail'] = $table_toplink->getRow();


$sql_as1 = "SELECT  * from type_master where tm_type like '%Approval Status%'";
$as_id = $fwDb->queryOne($sql_as1);		

$sql_as2 = "SELECT  * from type_options where to_type_id  =  ".$as_id['tm_id'] . " order by to_option desc";
$asdata = $fwDb->query($sql_as2);

$fwViewData['asdetail'] = $asdata ;

$sqlpr = "Select * from quote_builder_component";
$fwViewData['cdetail'] = $fwDb->query($sqlpr); 

