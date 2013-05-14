class User < ActiveRecord::Base
  attr_accessible :email, :name, :phone

  validates :email, :name, :phone, :presence => true
  #validates :email, :presence => true, :uniqueness => true
end
