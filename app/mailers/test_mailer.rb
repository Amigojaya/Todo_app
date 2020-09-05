class TestMailer < ApplicationMailer

	def test_mail_user(user, task)
		@user = user
		@task = task
		@todos_total = @task.todos.count
		@completed = @task.todos.where(completed: true).count
		 @width = @completed.to_f/@todos_total * 100

	    if @task.todos.exists? == true
	      
		      @width = @completed.to_f/@todos_total * 100
		    else
		      @width = 0
		end

		make_bootstrap_mail(to: @user.email, subject: "Test mail")
	end

	def alert_admin(user, quote)
		@quote = quote
		@user = user 

		make_bootstrap_mail(to: "moulijaya@gmail.com", subject: "Approve Quote")
	end

end
