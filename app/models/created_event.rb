class CreatedEvent < ApplicationRecord
  belongs_to :creator, :class_name => 'User'
  belongs_to :event, :class_name =>'Event'
end
