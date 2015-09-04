class TempSection < ActiveRecord::Base
  belongs_to :template_note
  has_one :company
  
  has_many :questions
  has_many :quest_choice , :through=> :questions
end
