class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :phone, :username
end
