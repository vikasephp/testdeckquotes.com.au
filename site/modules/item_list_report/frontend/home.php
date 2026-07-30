<?php
$pagenum = $fwRequest->getparam('pagenum','');
$keyword = $fwRequest->getParam('keyword', '');
$tablebs = new Fw_Db_Table('business_sellers');
$user_name = $_SESSION['user']['user_name'];

$where = "WHERE 1=1 ";
$fwViewData['ran'] =  rand(100000,999999);
$keyword = $fwRequest->getParam('keyword', '');
	
if($keyword):
$where .= "AND business.bsn_name LIKE '%".$keyword."%'";
	
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword'] && $pagenum > 0):

	$where .= "AND business.bsn_name LIKE '%".$_SESSION['keyword']."%'";
	
	$fwViewData['keyword']=$_SESSION['keyword'];
endif;
   
if(empty($pagenum))
	{
	unset($_SESSION['last_tdsql']);
	}
	 	

//$ord =  " ORDER BY  if(  bus_customers.bcust_vr_comp_date = ' '
//OR bus_customers.bcust_vr_comp_date IS NULL , 1, 0 ) desc , STR_TO_DATE( bus_customers.bcust_vr_comp_date, '%d-%m-%Y' ) desc ";

$ord = " Order by STR_TO_DATE( bus_customers.bcust_wcr_occ_date, '%d-%m-%Y' ) DESC ";

$sql = "SELECT  purchase_order_items.*, purchase_order.po_bsn_id, purchase_order.po_po_number  from purchase_order_items
        Inner Join purchase_order on purchase_order_items.pi_po_id = purchase_order.po_id";
	
 
if($sql){$userData = $fwDb->query($sql);}


$fwViewData['total'] = sizeof($userData);

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 200;
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

if($sql2)
{  

 $setdata2 = $fwDb->query($sql2);
 
foreach($setdata2 as $k => $v)
{
		$sql = "Select bsn_name from business where bsn_id = ". $v['po_bsn_id'];
		$bsndata = $fwDb->queryOne($sql);
		$setdata2[$k]['bsn_name'] = $bsndata['bsn_name']; 				
}
 
 	$fwViewData['list'] =  $setdata2;
 
 }
}

$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Item List Report";