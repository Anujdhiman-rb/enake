class PractiAvail < ActiveRecord::Base
  belongs_to :practi_info
  has_many :practi_break
end
