class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def get_tipo
     "#{tipo}"
     end
end
