class Payment < ActiveRecord::Base
  belongs_to :user
  attr_accessible :amount, :payment_date

  validates :amount, :presence => true
  #TODO: Add validation for amount>0

  validates :payment_date, :presence => true

end
