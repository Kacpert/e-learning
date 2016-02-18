class User < ActiveRecord::Base
  has_many :messages_users
  has_many :messages, through: :messages_users
  has_many :conversations_users
  has_many :conversations, through: :conversations_users
  has_many :groups_users
  has_many :groups, through: :groups_users
  has_many :courses_users
  has_many :courses, through: :courses_users
  before_create :generate_authentication_token!
  validates :auth_token, uniqueness: true
  validates :login, uniqueness: true
  validates :login, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def to_s
    self.login
  end

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end
end
