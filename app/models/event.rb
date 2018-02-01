class Event < ApplicationRecord
  has_many :created_events, foreign_key :creator_id
  has_many :creators, through :created_events, source :created_events
end
