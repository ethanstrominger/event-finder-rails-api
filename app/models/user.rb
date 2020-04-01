# frozen_string_literal: true

# Template instructions: add any tables related to User here
class User < ApplicationRecord
  include Authentication
  has_many :movies
  has_many :event_searches # changedoc - added
end
