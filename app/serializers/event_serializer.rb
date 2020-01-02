class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :date, :start_time, :end_time, :location, :image, :category, :city, :created_at, :longitude, :latitude
  # has_one :user
  has_many :event_comments
end
