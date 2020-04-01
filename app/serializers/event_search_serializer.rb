class EventSearchSerializer < ActiveModel::Serializer
  attributes :id, :source, :keyword, :start_date, :start_time, :end_date, :end_time
  has_one :user
end
