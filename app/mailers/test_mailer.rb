class TestMailer < ApplicationMailer

	def test_mail_user(user, task)
		@user = user
		@task = task
		@todos_total = @task.todos.count
		@completed = @task.todos.where(completed: true).count

	    if @task.todos.exists? == true
	      
		      @width = @completed.to_f/@todos_total * 100
		    else
		      @width = 0
		end

		mail(to: @user.email, subject: "Test mail")
	end

end
