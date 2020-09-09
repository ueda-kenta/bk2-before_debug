class ThanksMailer < ApplicationMailer
	default from: '3110testtest@gmail.com'

  def complete_mail(user)
    @user = user
    @url = "http://localhost:3000/users/#{@user.id}"
    mail(subject: "Thanks!" ,to: @user.email)
  end
end
