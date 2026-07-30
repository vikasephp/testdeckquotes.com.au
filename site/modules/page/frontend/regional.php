<?php
$page_id = (int)$fwRequest->getparam('page_id', 0);
	
/********** Begin slider images **********/	
//$sql = "SELECT adv_images.*, advertisement.adv_id, advertisement.adv_title FROM adv_images
//	LEFT JOIN  advertisement ON advertisement.adv_id = adv_images.adv_id	
//	WHERE adv_images.adv_image_status = 1 ORDER BY advertisement.adv_id DESC";
//
//$fwViewData['adv_images_list'] = $fwDb->query($sql);
////DB($fwViewData['adv_images_list']);
//
///********** End slider images **********/	
//	
//$thisTablelocation = new Fw_Db_Table('location');
//$fwViewData['location'] = $thisTablelocation->getAllRows();
///********** Begin business_interest **********/
//$business_interest_Table = new Fw_Db_Table('business_interest');
//$business_interest_Table->setWhere("bi_parent = 0");
//$interest = $business_interest_Table->getAllRows();
//$fwViewData['interest'] = $interest;
//
//$business_interest_Table->setWhere("bi_parent != 0");
//$business_interest_Table->setOrderBy("bi_title ASC");
//$sub_interest = $business_interest_Table->getAllRows();
//$fwViewData['sub_interest'] = $sub_interest;
//
//$fwViewData['news_detail']=newsData();
//
//$fwViewData['buyer_prospectData']=buyer_prospectData();

	
/********** End business_interest **********/
/*----------SEO parameters-----------------*/

if ($page_id > 0)
{
	$tablePages = new Fw_Db_Table('pages');
	$tablePages->setWhere("page_id = $page_id");
	$detail = $tablePages->getRow();


  	$fwViewData['title'] = trim(str_ireplace('  ',' ',$detail['page_title']));
    $fwViewData['seo_title'] = trim(str_ireplace('  ',' ',$detail['page_short_title']));
    $fwViewData['seo_description'] = trim(str_ireplace('  ',' ',$detail['page_metadesc']));
    $fwViewData['seo_keywords'] = trim(str_ireplace('  ',' ',$detail['page_metakeyword']));
	$fwViewData['opr'] = trim(str_ireplace('  ',' ',$detail['page_action_params']));
	$fwViewData['breadcrumb_title'] = $fwViewData['detail']['page_title'];
}
 /*--------------------------------SEO parameters----------------------------------------*/
 