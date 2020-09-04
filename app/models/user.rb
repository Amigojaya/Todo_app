class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :user_tasks, dependent: :destroy
    has_many :quotes, dependent: :destroy

    def subscribe?
    	self.subscribe == true
    end

end
