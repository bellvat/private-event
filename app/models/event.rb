class Event < ApplicationRecord
  has_many :created_events, :foreign_key => "event_id"
  has_many :creators, :through => :created_events, :source => :creator
end
