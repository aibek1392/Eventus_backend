class EventCommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user, :created_at, :updated_at
  # has_one :user
  # has_one :event
end
