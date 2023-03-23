class AddChatroomIdFromChats < ActiveRecord::Migration[6.1]
  def change
    add_column :chats, :chatroom_id, :integer, null: false
  end
end
