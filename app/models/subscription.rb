class Subscription < ActiveRecord::Base
  belongs_to :company
  has_one :plan
end
