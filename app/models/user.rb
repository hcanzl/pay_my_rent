class User < ActiveRecord::Base
  attr_accessible :email, :name, :phone

  validates :email, :name, :phone, :presence => true
  has_many :payments
  #validates :email, :presence => true, :uniqueness => true
end
