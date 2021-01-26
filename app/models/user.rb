class User < ApplicationRecord
  has_many :organisms
  has_many :infections
  # has_many :organisms, through: :infections

  # validates :email, :encrypted_password, :user_name, :type, presence: true
  validates :email, :encrypted_password, presence: true
  # validates :type, inclusion: { in: ['virus', 'owner'], allow_nil: false }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
