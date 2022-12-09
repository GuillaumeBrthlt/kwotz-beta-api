class QuoteRequestMailer < ApplicationMailer
  default from: "bertholetguillaume@gmail.com" 
  
  def quote_request_send(user, quote_request)
    @quote_request = quote_request
    mail(to: user.email, subject: 'Nouvelle demande de prix')
  end

end
