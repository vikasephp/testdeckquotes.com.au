<?php

require_once(LIB_DIR . 'Fw/Ecom/Shipping/Ups.php');

class Fw_Ecom_Shipping_Ups_RatesAndServiceSelection extends Fw_Ecom_Shipping_Ups
{
    public function __construct()
    {
        parent::__construct();
    }
    
    public function getRate($service, $weight, $dest_zip, $dest_country = 'US', $src_zip = '', $src_country = '')
    {
        if (empty($src_zip))
        {
            $src_zip = $this->ShipperZip;
            $src_country = $this->ShipperCountry;
        }
        
        $request = "<?xml version=\"1.0\"?>  
<AccessRequest xml:lang=\"en-US\">  
    <AccessLicenseNumber>$this->AccessLicenseNumber</AccessLicenseNumber>  
    <UserId>$this->UserId</UserId>  
    <Password>$this->Password</Password>  
</AccessRequest>  
<?xml version=\"1.0\"?>  
<RatingServiceSelectionRequest xml:lang=\"en-US\">  
    <Request>  
        <TransactionReference>  
            <CustomerContext>Rate Request</CustomerContext>  
            <XpciVersion>1.0001</XpciVersion>  
        </TransactionReference>  
        <RequestAction>Rate</RequestAction>  
        <RequestOption>Rate</RequestOption>  
    </Request>  
    <Shipment>  
        <Shipper>  
            <Address>  
                <PostalCode>$this->ShipperZip</PostalCode>  
                <CountryCode>$this->ShipperCountry</CountryCode>  
            </Address>  
            <ShipperNumber>$this->ShipperNumber</ShipperNumber>  
        </Shipper>  
        <ShipTo>  
            <Address>  
                <PostalCode>$dest_zip</PostalCode>  
                <CountryCode>$dest_country</CountryCode>  
            </Address>  
        </ShipTo>  
        <ShipFrom>  
            <Address>  
                <PostalCode>$src_zip</PostalCode>  
                <CountryCode>$src_country</CountryCode>  
            </Address>  
        </ShipFrom>
        <Service>
    		<Code>$service</Code>
        </Service>             
        <Package>  
            <PackagingType>  
                <Code>00</Code>  
            </PackagingType>  
            <PackageWeight>  
                <UnitOfMeasurement>  
                    <Code>LBS</Code>  
                </UnitOfMeasurement>  
                <Weight>$weight</Weight>  
            </PackageWeight>  
        </Package>  
    </Shipment>  
</RatingServiceSelectionRequest>";

        $ch = curl_init('https://wwwcie.ups.com/ups.app/xml/Rate');  
		curl_setopt($ch, CURLOPT_HEADER, 0);  
		curl_setopt($ch, CURLOPT_POST, 1);  
		curl_setopt($ch, CURLOPT_TIMEOUT, 60);  
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);  
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);  
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);  
		curl_setopt($ch, CURLOPT_POSTFIELDS, $request);  
		$response = curl_exec($ch);

        file_put_contents('C:\RatesAndServiceSelection.txt', $request . "\n\n\n\n" . $response);     
	    
        $objXml = new SimpleXMLElement($response);
        
        $ShippingCost = (float)$objXml->RatedShipment->TotalCharges->MonetaryValue;
        $ShippingCost = (float)sprintf('%.2f', $ShippingCost);
        
        return $ShippingCost;
    }
    
    public function getServices($weight, $dest_zip, $dest_country = 'US', $src_zip = '', $src_country = '')
    {
        if (empty($src_zip))
        {
            $src_zip = $this->ShipperZip;
            $src_country = $this->ShipperCountry;
        }
        
        $request = "<?xml version=\"1.0\"?>  
<AccessRequest xml:lang=\"en-US\">  
    <AccessLicenseNumber>$this->AccessLicenseNumber</AccessLicenseNumber>  
    <UserId>$this->UserId</UserId>  
    <Password>$this->Password</Password>  
</AccessRequest>  
<?xml version=\"1.0\"?>  
<RatingServiceSelectionRequest xml:lang=\"en-US\">  
    <Request>  
        <TransactionReference>  
            <CustomerContext>Services Request</CustomerContext>  
            <XpciVersion>1.0001</XpciVersion>  
        </TransactionReference>  
        <RequestAction>Rate</RequestAction>  
        <RequestOption>Shop</RequestOption>  
    </Request>  
    <Shipment>  
        <Shipper>  
            <Address>  
                <PostalCode>$this->ShipperZip</PostalCode>  
                <CountryCode>$this->ShipperCountry</CountryCode>  
            </Address>  
            <ShipperNumber>$this->ShipperNumber</ShipperNumber>  
        </Shipper>  
        <ShipTo>  
            <Address>  
                <PostalCode>$dest_zip</PostalCode>  
                <CountryCode>$dest_country</CountryCode>  
            </Address>  
        </ShipTo>  
        <ShipFrom>  
            <Address>  
                <PostalCode>$src_zip</PostalCode>  
                <CountryCode>$src_country</CountryCode>  
            </Address>  
        </ShipFrom>  
        <Package>
            <PackagingType>  
                <Code>00</Code>  
            </PackagingType>  
            <PackageWeight>  
                <UnitOfMeasurement>  
                    <Code>LBS</Code>  
                </UnitOfMeasurement>  
                <Weight>$weight</Weight>  
            </PackageWeight>  
        </Package>  
    </Shipment>  
</RatingServiceSelectionRequest>";

        $ch = curl_init('https://wwwcie.ups.com/ups.app/xml/Rate');  
		curl_setopt($ch, CURLOPT_HEADER, 0);  
		curl_setopt($ch, CURLOPT_POST, 1);  
		curl_setopt($ch, CURLOPT_TIMEOUT, 60);  
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);  
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);  
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);  
		curl_setopt($ch, CURLOPT_POSTFIELDS, $request);  
		$response = curl_exec($ch);
        
        file_put_contents('C:\RatesAndServiceSelection.txt', $request . "\n\n\n\n" . $response);     

        $objXml = new SimpleXMLElement($response);
        
        $services = array();
        
        foreach($objXml->RatedShipment as $RatedShipment)
        {
            $ServiceCode = (string)$RatedShipment->Service->Code;
            $ServiceName = $this->Services[$ServiceCode];
            $ShippingCost = (float)$RatedShipment->TotalCharges->MonetaryValue[0];
            $ShippingCost = sprintf('%.2f', $ShippingCost);
            
            $services[] = array('ServiceCode'   => $ServiceCode,
                                'ServiceName'   => $ServiceName,
                                'ShippingCost'  => $ShippingCost);
        }

        return $services;
    }
}