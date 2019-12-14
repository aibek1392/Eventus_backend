class Event < ApplicationRecord
  belongs_to :user

  has_many :event_comments
  has_many :users_commented, through: :event_comments, source: :user

  has_many :user_events
  has_many :attending_users, through: :user_events, source: :user

  has_many :favorite_events
    has_many :favorited_by_users, through: :favorite_events, source: :user
end
