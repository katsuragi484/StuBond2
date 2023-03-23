class RemoveRoomIdFromChats < ActiveRecord::Migration[6.1]
  def change
    remove_column :chats, :room_id, :integer
  end
end
