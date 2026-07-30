<?php
$fwMainView = 'file:' . getcwd() . '/listdata.tpl';
$pagenum = $fwRequest->getparamget('pagenum','');
$cust_id = $fwRequest->getparamget('cust_id', 0);
if($cust_id){
$sql = "SELECT byer_enquiry.*, business.bsn_id, business.bsn_name  FROM byer_enquiry
				LEFT JOIN business ON byer_enquiry.be_business_id = business.bsn_id
				WHERE  byer_enquiry.be_customer_id = ".$cust_id;
	
$userData = $fwDb->query($sql);

if($sql){$userData = $fwDb->query($sql);}

if(!empty($userData))
{
if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 2;
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

}}