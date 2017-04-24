class Officina < ApplicationRecord
  belongs_to :user
  
  VALID_NUMERO_TEL_REGEX=/\A[0-9]{1,14}\z/i
  VALID_INDIRIZZO_REGEX=/\A([A-Z][a-z]+)(\s?[A-Z][a-z]*'?[a-z]+)+\z/i
  VALID_CONTATTO_REGEX=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :numero_telefono, presence: {:message => " : inserire il numero di telefono"}, 
  format: { with: VALID_NUMERO_TEL_REGEX , :message => " : formato non supportato"}
  
  validates :indirizzo, presence: {:message => " : inserire indirizzo"}, 
  format: { with: VALID_INDIRIZZO_REGEX , :message => " : formato non supportato"}
  
  validates :contatto, presence: {:message => " : inserire il contatto"}, 
  format: { with: VALID_CONTATTO_REGEX , :message => " : formato non supportato"}
  
end
