task :send_quote => :environment do
	User.all.where(subscribe_quote: true).each do |user|
		quote = Quote.order("RANDOM()").first
		TestMailer.daily_quote(user,quote).deliver_now
	end
	EmailSubscribe.all.each do |guest_user|
		quote = Quote.order("RANDOM()").first
		TestMailer.daily_quote(guest_user,quote).deliver_now
	end
end