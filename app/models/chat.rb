class Chat < ApplicationRecord
  belongs_to :admin, optional: true
  belongs_to :student, optional: true
  belongs_to :parent, optional: true
  belongs_to :chatroom
end
