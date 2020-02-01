class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :date, :start_time, :end_time, :location, :image, :category, :city, :created_at, :longitude, :url, :latitude, :zip_code
  # has_one :user
  has_many :event_comments
end
