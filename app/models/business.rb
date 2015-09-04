class Business < ActiveRecord::Base
  serialize :address , JSON
  serialize :reg_info , JSON
  
  attr_accessible  :name , :address , :reg_info , :web_url , :contact_info , :online_booking
  
  belongs_to :company
  has_many :users
  
  
  
  # validates_presence_of :business_name 
  # validates :web_url, :presence => {:message => 'URL cannot be blank.'}, :format => {:with => /\A[www]+[A-Za-z0-9._%+-]+\.[A-Za-z]+\z/, :message => 'INCORRECT FORMAT!'}

end
