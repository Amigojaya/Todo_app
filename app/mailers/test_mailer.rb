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
		
		make_bootstrap_mail(to: @user.email, subject: "New Todo #{@task.name.capitalize}")
	end

	def alert_admin(user, quote)
		@quote = quote
		@user = user 

		make_bootstrap_mail(to: "moulijaya@gmail.com", subject: "Approve Quote #{@user.email.capitalize}")
	end

	def daily_quote(user,quote)
		@quote = quote
		@user = user
		make_bootstrap_mail(to: @user.email, subject: "Daily Motivation #{Date.today.strftime("%d-%m-%Y")}")
	end

end
