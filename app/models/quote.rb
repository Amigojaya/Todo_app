class Quote < ApplicationRecord
	belongs_to :user, optional: true
end
