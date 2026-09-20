<?php
$pagenum = $fwRequest->getparam('pagenum','');
$tablePages = new Fw_Db_Table($TABLE);
$tablestatus = new Fw_Db_Table('customers_status');
$tableintrest = new Fw_Db_Table('customers_type');
$submit = $fwRequest->getParam('search', '');
$tablePages->setOrderBy($ID.' DESC');
//$catdata=$tablePages->getAllRows();
//$fwViewData['list'] = $catdata; 

if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	$string ="";
	if($detail['bcust_fname']){$string.= "bcust_fname LIKE '%".trim($detail['bcust_fname'])."%' AND ";}
	if($detail['bcust_lname']){$string.= "bcust_lname LIKE '%".trim($detail['bcust_lname'])."%' AND ";}
	if($detail['bcust_misc_email1']){$string.= "bcust_misc_email1 LIKE '%".trim($detail['bcust_misc_email1'])."%' AND ";}
	if($detail['bcust_status']){$string.= "bcust_status = ".trim($detail['bcust_status'])." AND ";}
	if($detail['bcust_type']){$string.= "bcust_type = ".trim($detail['bcust_type'])." AND ";}
	if($detail['bcust_misc_logged_date_date_from'] AND empty($detail['bcust_misc_logged_date_date_to'])){$string.= "bcust_misc_logged_date_date >= '".trim($detail['bcust_misc_logged_date_date_from'])."' AND ";}
	
	if(empty($detail['bcust_misc_logged_date_date_from']) AND $detail['bcust_misc_logged_date_date_to']){$string.= "bcust_misc_logged_date_date <= '".trim($detail['bcust_misc_logged_date_date_to'])."' AND ";}
	
	if($detail['bcust_misc_logged_date_date_from'] AND $detail['bcust_misc_logged_date_date_to']){$string.= "bcust_misc_logged_date_date BETWEEN '".trim($detail['bcust_misc_logged_date_date_from'])."' AND '".trim($detail['bcust_misc_logged_date_date_to'])."' AND ";}
	
	if($detail['bcust_isbuyer']){$string.= "bcust_isbuyer = 1 AND ";}
	
	if($detail['bcust_isseller']){$string.= "bcust_isseller = 1 AND ";}	
	
	if($detail['phones']){$string.= "bcust_misc_moble LIKE '%".trim($detail['phones'])."' OR bcust_misc_business LIKE '".trim($detail['phones'])."' OR bcust_misc_home LIKE '".trim($detail['phones'])."' AND ";}

	$string = substr($string, 0, -5);
	unset($_SESSION['last_sql']);
$fwViewData['detail'] = $detail;
}	

if(empty($_SESSION['last_sql']))
{
if($string)
{
$sql = "SELECT bus_customers.*, customers_status.*, customers_type.* FROM bus_customers LEFT JOIN customers_status ON bus_customers.bcust_status = customers_status.cs_id LEFT JOIN customers_type ON bus_customers.bcust_type = customers_type.ct_id  WHERE ".$string;

}
else
{
$sql = "SELECT bus_customers.*, customers_status.*, customers_type.* FROM bus_customers LEFT JOIN customers_status ON bus_customers.bcust_status = customers_status.cs_id LEFT JOIN customers_type ON bus_customers.bcust_type = customers_type.ct_id ";
}
}else{$sql = $_SESSION['last_sql'];}

if($sql){$userData = $fwDb->query($sql);}

if (!(isset($pagenum)))
    {
        $pagenum = 1;
    } 

    $rows = count($userData);
    
    $page_rows = 1;
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
    
    $fwViewData['pagenum'] = $pagenum;
	
    $max = 'limit ' .($pagenum - 1) * $page_rows .',' .$page_rows;
    
    $sql2 =  $sql." ".$max;

if($sql2){$fwViewData['list']= $fwDb->query($sql2);}

$pagenatedata = $pagenum;
for($i=0; $i<9; $i++)
	{
	$paginate[$pagenatedata] = $pagenatedata;
	$pagenatedata ++;
	}
DB($paginate);
exit;


$fwViewData['title'] = $MODULE_PLURAL;
$tablestatus->setOrderBy('cs_id'.' ASC');
$fwViewData['customers_status']=$tablestatus->getAllRows();
$tableintrest->setOrderBy('ct_id'.' ASC');
$fwViewData['customers_type']=$tableintrest->getAllRows();
$_SESSION['last_sql'] = $sql;