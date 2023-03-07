class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|

      t.integer :admin_id
      t.integer :student_id
      t.integer :parent_id
      t.integer :room_id, null: false
      t.string :message, null: false
      t.timestamps
    end
  end
end
