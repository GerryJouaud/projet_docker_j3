# User model
# Represents a user in the system and has many posts
class User < ApplicationRecord
  has_many :posts, dependent: :destroy
end
