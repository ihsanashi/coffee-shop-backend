class User < ApplicationRecord
  belongs_to :role
  has_one :profile
end
