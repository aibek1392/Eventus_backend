class UserSerializer < ActiveModel::Serializer
  attributes :id, :username,  :image, :location 
  has_many :user_events
  has_many :favorite_events 
  has_many :event_comments
end
