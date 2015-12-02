# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  email           :string
#  birthday        :datetime
#  password_digest :string
#  remember_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_one :buyer
  has_one :seller
  has_many :locations
  has_many :phones

  has_secure_password 
  attr_accessor :remember_token

    def name
      "#{first_name} #{last_name}"      
    end

  def self.digest(string)
       cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
       BCrypt::Password.create(string, cost: cost)
     end

     def self.new_token
       SecureRandom.urlsafe_base64
     end

     def remember
       self.remember_token = User.new_token
       update_attribute(:remember_digest, User.digest(remember_token))
     end

     def authenticated?(remember_token)
       return false if remember_digest.nil?
       BCrypt::Password.new(remember_digest).is_password?(remember_token)
     end

    def forget
       update_attribute(:remember_digest, nil)
    end

  # Seller.create(user_id: self.id)
  # Buyer.create(user_id: self.id)

end
