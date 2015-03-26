class UserMailer < ApplicationMailer
   default from: 'noreply@clustercard.net'

   def welcome_email(card)
   	@card = card
    mail(to: @card.email, subject: 'You have created a Video ClusterCard')
  end
end
