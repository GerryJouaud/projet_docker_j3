# Base class for all models in Rails
# Inherits from ActiveRecord::Base and enables shared logic for all models
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
