<?php

	$fwViewData['detail'] = $detail;
	
  	$fwViewData['title'] = trim(str_ireplace('  ',' ',$detail['page_title']));
    $fwViewData['seo_title'] = trim(str_ireplace('  ',' ',$detail['page_short_title']));
    $fwViewData['seo_description'] = trim(str_ireplace('  ',' ',$detail['page_metadesc']));
    $fwViewData['seo_keywords'] = trim(str_ireplace('  ',' ',$detail['page_metakeyword']));
	$fwViewData['opr'] = trim(str_ireplace('  ',' ',$detail['page_action_params']));
	$fwViewData['breadcrumb_title'] = $fwViewData['detail']['page_title'];

 /*--------------------------------SEO parameters----------------------------------------*/
