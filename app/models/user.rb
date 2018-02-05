class User < ApplicationRecord
  has_many :created_events, :foreign_key => 'creator_id'
  has_many :events, :through => :created_events, :source => :event

  has_many :event_attendee, :foreign_key => 'attendee_id'
  has_many :attended_events, :through => :event_attendee, :source => :attended_event
end
