class Payment < ActiveRecord::Base
  belongs_to :user
  attr_accessible :amount, :payment_date

  validates :amount, :numericality => { :greater_than => 0 }
  validates :payment_date, :presence => true
end
