class Payment < ActiveRecord::Base
  belongs_to :user

  attr_accessible :amount, :payment_date, :paid, :rent_due

  validates :amount, :numericality => { :greater_than => 0 }
  validates :payment_date, :presence => true
end
