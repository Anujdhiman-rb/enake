class SmsSetting < ActiveRecord::Base
  belongs_to :company
  has_one :sms_credit
end
