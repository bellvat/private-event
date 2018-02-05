class Event < ApplicationRecord
  has_many :created_events, :foreign_key => "event_id"
  has_many :creators, :through => :created_events, :source => :creator

  has_many :event_attendee, :foreign_key => 'attended_event_id'
  has_many :attendees, :through => :event_attendee, :source => :attendee

  def self.past
    self.where("e_date < :today", {today: Date.today.to_s})
  end

  def self.upcoming
    self.where("e_date >= :today", {today: Date.today.to_s})
  end
end
