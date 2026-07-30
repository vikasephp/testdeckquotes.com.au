<?php

require_once(LIB_DIR . 'Fw/Ecom/Shipping/Ups.php');

class Fw_Ecom_Shipping_Ups_UsAddressValidation extends Fw_Ecom_Shipping_Ups
{
    protected $City;
    protected $StateProvinceCode;
    protected $PostalCode;
    protected $ValidationMode;
    
    public function __construct()
    {
        parent::__construct();
        
        $this->ValidationMode = 'Exact';
    }
    
    public function setAddress($PostalCode, $StateProvinceCode = '', $City = '')
    {
        $this->PostalCode = $PostalCode;
        $this->StateProvinceCode = $StateProvinceCode;
        $this->City = $City;
    }
    
    public function getAddress($PostalCode, $StateProvinceCode = '', $City = '')
    {
        $address = array();
        $address['City'] = $this->City;
        $address['StateProvinceCode'] = $this->StateProvinceCode;
        $address['PostalCode'] = $this->PostalCode;
        
        return $address;
    }
    
    public function setValidationMode($ValidationMode)
    {
        if ($ValidationMode == 'Approximate')
        {
            $this->ValidationMode = $ValidationMode;
        }
        else
        {
            $this->ValidationMode = 'Exact';
        }
    }
    
    public function validate()
    {
        $city_tag = "<City/>";
        if (!empty($this->City))
        {
            $city_tag = "<City>$this->City</City>";
        }
        
        $state_tag = "<StateProvinceCode/>";
        if (!empty($this->StateProvinceCode))
        {
            $state_tag = "<StateProvinceCode>$this->StateProvinceCode</StateProvinceCode>";
        }
        
        $request = "<?xml version=\"1.0\"?>  
<AccessRequest xml:lang=\"en-US\">  
    <AccessLicenseNumber>$this->AccessLicenseNumber</AccessLicenseNumber>  
    <UserId>$this->UserId</UserId>  
    <Password>$this->Password</Password>  
</AccessRequest>  
<?xml version=\"1.0\"?>
<AddressValidationRequest xml:lang=\"en-US\">
    <Request>
        <TransactionReference>
            <CustomerContext>Address Validation</CustomerContext>
            <XpciVersion>1.0001</XpciVersion>
        </TransactionReference>
        <RequestAction>AV</RequestAction>
    </Request>
    <Address>
        $city_tag
        $state_tag
        <PostalCode>$this->PostalCode</PostalCode>
    </Address>
</AddressValidationRequest>";

        $ch = curl_init('https://wwwcie.ups.com/ups.app/xml/AV');  
		curl_setopt($ch, CURLOPT_HEADER, 0);  
		curl_setopt($ch, CURLOPT_POST, 1);  
		curl_setopt($ch, CURLOPT_TIMEOUT, 60);  
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);  
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);  
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);  
		curl_setopt($ch, CURLOPT_POSTFIELDS, $request);  
		$response = curl_exec($ch);
        
        $objXml = new SimpleXMLElement($response);
        
        $validation_result = (int)$objXml->Response->ResponseStatusCode;

        if ($validation_result === 1)
        {
            if ($this->ValidationMode == 'Exact')
            {
                $address_rank = (int)$objXml->AddressValidationResult->Rank;
                $address_quality = (float)$objXml->AddressValidationResult->Quality;
                $address_quality = (float)sprintf('%.2f', $address_quality);
                
                if ($address_rank === 1 && $address_quality === 1.00)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return true;
            }
        }
        else
        {
            return false;
        }
    }
    
    public function getMatchingAddresses()
    {
        die('Sorry, not implemented yet!');
    }
}       