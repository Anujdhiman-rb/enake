class Question < ActiveRecord::Base
  belongs_to :temp_section
  has_many :quest_choice
  
end
