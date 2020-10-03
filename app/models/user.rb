class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable

    has_many :user_tasks, dependent: :destroy
    has_many :quotes, dependent: :destroy

    def subscribe?
    	self.subscribe == true
    end

end
