# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#  remember_token  :string(255)
#

class User < ActiveRecord::Base

  has_secure_password  # creates User.authenticate(pwd) (authenticate model)

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: {case_sensitive: false}.
  validates :passwod, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true


  before_save :create_remember_token


private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end


end
