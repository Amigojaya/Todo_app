task :set_admin => :environment do
	admin_user = User.where(email: 'moulijaya@gmail.com').first
	if admin_user.present? && !admin_user.admin
		admin_user.admin = true
		admin_user.save!
		puts "Admin is successfully set"

		quotes = Quote.all
		quotes.update_all(user_id: 1)
	end
end