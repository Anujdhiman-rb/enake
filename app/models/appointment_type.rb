class AppointmentType < ActiveRecord::Base
  serialize :prefer_practi , JSON
  
  attr_accessible :name, :description, :category , :duration_time, :billable_item ,:default_note_template ,:related_product , :color_code, :reminder, :prefer_practi
  
  belongs_to :company
end
