class UserTask < ApplicationRecord
	has_many :todos, dependent: :destroy
	belongs_to :user
	accepts_nested_attributes_for :todos, reject_if: :all_blank, allow_destroy: true
	validates_presence_of :user_id
end
