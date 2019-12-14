class EventCommentSerializer < ActiveModel::Serializer
  attributes :id, :content
  # has_one :user
  has_one :event
end
