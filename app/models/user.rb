class User < ApplicationRecord
  has_many :created_events, :foreign_key => 'creator_id'
  has_many :events, :through => :created_events, :source => :event
end
