class CreatedEvent < ApplicationRecord
  belongs_to :creators, class_name :'User'
  belongs_to :events, class_name :'Event'
end
