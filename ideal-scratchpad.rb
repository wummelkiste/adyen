$:.unshift File.expand_path("../lib", __FILE__)

require "adyen/api"

Adyen::API.username = 'ws@Company.SuperShop'
Adyen::API.password = 'secret'

class IDEAL < Adyen::API::PaymentService
  ENDPOINT_URI = 'https://pal-%s.adyen.com/pal/servlet/soap/Ideal'

  def list_banks
    data = %{<ns1:retrieveIdealIssuerList xmlns:ns1="http://payment.services.adyen.com"/>}

    call_webservice_action('retrieveIdealIssuerList', data, Adyen::API::Response)
  end
end

ideal = IDEAL.new
response = ideal.list_banks
puts response.body

# Response:
#
#<?xml version="1.0"?>
#<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  #<soap:Body>
    #<ns1:retrieveIdealIssuerListResponse xmlns:ns1="http://payment.services.adyen.com">
      #<ns1:idealIssuerList>
        #<ns1:IdealIssuer>
          #<issuerId xmlns="http://payment.services.adyen.com">0151</issuerId>
          #<issuerList xmlns="http://payment.services.adyen.com">Short</issuerList>
          #<issuerName xmlns="http://payment.services.adyen.com">Test Issuer 2</issuerName>
        #</ns1:IdealIssuer>
        #<ns1:IdealIssuer>
          #<issuerId xmlns="http://payment.services.adyen.com">0121</issuerId>
          #<issuerList xmlns="http://payment.services.adyen.com">Short</issuerList>
          #<issuerName xmlns="http://payment.services.adyen.com">Test Issuer</issuerName>
        #</ns1:IdealIssuer>
      #</ns1:idealIssuerList>
    #</ns1:retrieveIdealIssuerListResponse>
  #</soap:Body>
#</soap:Envelope>
