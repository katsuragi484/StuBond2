class Chat < ApplicationRecord
  belongs_to :admin
  belongs_to :student
  belongs_to :parent
  belongs_to :chat_room
end
