class User < ActiveRecord::Base
  serialize :phone , Array

  attr_accessible :email , :phone , :password  , :time_zone ,:auth_factor , :title , :first_name , :last_name , :role , :acc_active , :is_doctor
  attr_accessor :password

  belongs_to :business
  has_one :company
  has_one :practi_info , :dependent=> :destroy 
  has_many :practi_refers , :through=> :practi_info
  has_many :practi_avails , :through=> :practi_info
  
  validates :first_name , :last_name , :presence =>true
  # validates :password, :confirmation => true , :on=> :update
  # validates :password_confirmation, :presence => true , :on=> :update
  validates_presence_of :password, :on => :create
  validates_presence_of :email, :on => :create
  validates_uniqueness_of :email
  
  before_save :encrypt_password  
  
  def self.authenticate_by_email(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  # def self.authenticate_by_username(username, password)
    # user = find_by_username(username)
    # if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      # user
    # else
      # nil
    # end
  # end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  
end
