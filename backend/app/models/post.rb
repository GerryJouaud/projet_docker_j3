# Post model
# Represents a blog post or article, belongs to a user
class Post < ApplicationRecord
  belongs_to :user
end
