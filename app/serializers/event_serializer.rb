class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :date, :start_time, :end_time, :location, :image, :category
  # has_one :user
end
