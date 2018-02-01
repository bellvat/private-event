class User < ApplicationRecord
  has_many :created_events, foreign_key :created_event_id
  has_many :events, through :created_events, source :created_events
end
