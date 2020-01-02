class EventCommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user
  # has_one :user
  # has_one :event
end
