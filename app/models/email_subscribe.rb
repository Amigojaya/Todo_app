class EmailSubscribe < ApplicationRecord
	validates :email, uniqueness: true, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: ":  Entered Email is not valid "}
end
