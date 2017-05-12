class Scadenze < ApplicationRecord
  belongs_to :user
  def get_targa
    "#{targa}"
  end
end
