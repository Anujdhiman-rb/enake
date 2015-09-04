class PractiInfo < ActiveRecord::Base
  serialize :services_type , JSON
  
  attr_accessible :designation , :desc , :services_type, :default_type , :notify_by , :cancel_time, :is_online 

  belongs_to :user
  has_many :practi_refers
  has_many :practi_avails
  has_many :practi_breaks , :through=> :practi_avails
  
  before_save :set_default_services
  
  def set_default_services
    self.services_type ||={:first=>false , :standard=>false}
  end
  
end
