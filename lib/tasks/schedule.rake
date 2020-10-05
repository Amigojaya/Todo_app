task :send_quote => :environment do
	User.all.where(subscribe_quote: true).each do |user|
		TestMailer.daily_quote(user).deliver_now
	end
	EmailSubscribe.all.each do |guest_user|
		TestMailer.daily_quote(guest_user).deliver_now
	end
end