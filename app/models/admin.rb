class Admin < ActiveRecord::Base

  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable

  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me

end
