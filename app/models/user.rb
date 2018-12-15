class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  def self.find_or_create_by_clio_code(code)
    user_info = Clio.get_user_info_from(code)
    
    if user_info && user_info[:email] != nil
      if !(user = User.find_by(email: user_info[:email]))
        user = User.create(email: user_info[:email], password: Devise.friendly_token[0,20])
      end
      user.set_tokens(user_info)
      user
    else
      nil
    end
  end

  def set_tokens(user_info)
    self.clio_access_token = user_info[:access_token]
    self.clio_refresh_token = user_info[:refresh_token]
    self.save
  end
end
