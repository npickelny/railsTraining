class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  devise :omniauthable, omniauth_providers: %i[google_oauth2 facebook]

  def self.from_auth(access_token)
    user = User.find_by(email: access_token.info['email'])
    unless user
      user = User.create(
          email: access_token.info['email'],
          password: Devise.friendly_token[0, 20],
          provider: access_token.provider,
          uid: access_token.uid
      )
    end
    user
  end
end
