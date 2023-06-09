class Parent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :students, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :chatrooms, dependent: :destroy

  validates :code, uniqueness: true


end
