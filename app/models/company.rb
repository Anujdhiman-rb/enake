class Company < ActiveRecord::Base
  serialize :calendar_setting , JSON
  
  attr_accessible  :company_name , :first_name , :last_name,
   :email , :password , :country, :time_zone , :attendees, :communication_email, :calendar_setting,
   :patient_name_by , :multi_appointment, :show_time_indicator ,:note_letter , 
   :show_finance, :show_attachment
  attr_accessor :password
  
  has_many :businesses
  has_many :users , :through=> :businesses
  has_many :appointment_types
  has_many :billable_items
  has_many :tax_settings
  has_many :template_notes
  has_many :concessions
  has_many :temp_sections , :through=> :template_notes
  has_one :online_booking
  has_one :sms_setting
  has_one :sms_credit , :through=> :sms_setting
  has_one :subscription
  has_one :plan , :through=>:subscription
 
  # validates :company_name , :first_name , :last_name, :email, :password, :presence => true 
  validates_uniqueness_of :email
  
  
  before_save :default_values , :default_calendar_settings
  before_save :encrypt_password
#   
# #   callback to generate business and user as company created 
  # after_save :create_business_and_user
# 
 

  def default_values
    self.communication_email ||= self.email
  end
  
  def default_calendar_settings
    self.calendar_setting ||= {:size=>15 , :height=>15 , :time_range => {:min_time=> 7 , :max_time=>22} }
  end

 #   callback method to create business and user as any cliniko is created 
  # def create_business_and_user
      # business = self.businesses.create(:business_name=> self.company_name)
      # business.save
#         
  # end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  

end
