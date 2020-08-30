class Todo < ApplicationRecord
  belongs_to :user_task
  #because cocoon gem retrive by created_at but its not best idea so i added this 
  default_scope { order('id ASC') } 
end
