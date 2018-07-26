class UserMailer < ApplicationMailer
  default from: "info@mushrooming.com"

  def contact_form(email, name, message)
    @message = message
       mail(from: email,
        to: 'mail@judithurban.de',
        subject: "A new contact form message from #{name}")
  end
end
