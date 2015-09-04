class TemplateNote < ActiveRecord::Base
  belongs_to :company
  has_many :temp_sections
  has_many :questions , :through => :temp_sections
end
