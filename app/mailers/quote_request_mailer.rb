class QuoteRequestMailer < ApplicationMailer
  default from: "bertholetguillaume@gmail.com" 
  
  def quote_request_send(quote_request)
    @quote_request = quote_request
    mail(to: quote_request.email, subject: 'Nouvelle demande de prix')
  end

end
