class Chatroom < ApplicationRecord
  has_many :chats, dependent: :destroy
  belongs_to :admin
  belongs_to :student
  belongs_to :parent
end
