<?php

$tableRating = new Fw_Db_Table('buyer_rating');

$ratingDetail['rating_bcust_id'] = $_POST['id'];
$ratingDetail['rating_score'] = $_POST['value'];

$tableRating->setWhere("rating_bcust_id =".$ratingDetail['rating_bcust_id']); 

		if($tableRating->rowExists())
			{
			unset($ratingDetail['rating_id']);
			$tableRating->updateRow($ratingDetail);
			}
			else
			{
			$tableRating->insertRow($ratingDetail);
			}

echo $value;
echo "<br>";
echo $productId;