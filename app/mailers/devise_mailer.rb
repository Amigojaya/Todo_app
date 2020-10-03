class DeviseMailer < Devise::Mailer
	helper  :application 
  	include Devise::Controllers::UrlHelpers 
	default from: 'TODO APP <todoapp@gmail.com>'
  	layout 'mailer'
end