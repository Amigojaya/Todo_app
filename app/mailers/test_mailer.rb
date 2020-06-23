class TestMailer < ApplicationMailer

	def test_mail_user(user, task)
		@user = user
		@task = task
		mail(to: @user.email, subject: "Test mail")
	end

end
