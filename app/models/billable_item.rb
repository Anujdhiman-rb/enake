class BillableItem < ActiveRecord::Base
  serialize :concession_price , JSON
  
  attr_accessible :item_code , :name , :price, :include_tax , :tax , :concession_price
  
  belongs_to :company
  
  before_save :set_concession_price
  
  def set_concession_price
    self.concession_price ||= {}
  end
  
end
