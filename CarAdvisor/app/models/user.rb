class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token, :reset_token
  has_many :autoveicolos, dependent: :destroy
  has_many :officinas, dependent: :destroy
  before_save   :downcase_email
  before_create :create_activation_digest
  before_save { self.email = email.downcase }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_NOME_REGEX = /\A([A-Z][a-z]+)(\s?[A-Z][a-z]*'?[a-z]+)*\z/i
  VALID_COGNOME_REGEX =/\A([A-Z][a-z]*'?[a-z]+)+\z/i
  
  
  validates :nome, presence: { :message => ": inserire un nome" }, length: { maximum: 50 } ,
  format: { with: VALID_NOME_REGEX , :message => ":formato non supportato"}, on: :create
 

  validates :cognome, presence: { :message => ": inserire un cognome"  }, length: { maximum: 50 } ,
  format: { with: VALID_COGNOME_REGEX , :message => ":formato non supportato"}, on: :create
  
  validates :email, presence: { :message => ": inserire un'email"  }, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX , :message => ":formato non supportato"},
                    uniqueness: { case_sensitive: false } 
  
  
 
  has_secure_password
  
  validates :password, presence: { :message => ": inserire una password"  }, length: { minimum: 6 }, allow_blank: true ,on: :create
  validates :password, :presence => TRUE, :on => :update

  def get_meccanico
        "#{nome} #{cognome}"
  end     
		
  
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  #check link password
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  #token ricordami
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  #crea token per reset password
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end
 
  #manda email per reset password
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end
  
  #attiva account + data
  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  #manda email per attivazione
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end
 
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end


  def forget
    update_attribute(:remember_digest, nil)
  end

  def downcase_email
      self.email = email.downcase
  end
  def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
   end
end
