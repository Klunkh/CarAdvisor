class Conversazione < ApplicationRecord
  belongs_to :user
  belongs_to :destinatario
end
