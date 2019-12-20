class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :date, :start_time, :end_time, :location, :image, :category, :created_at, :longitude, :latitude
  # has_one :user
end
