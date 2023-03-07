class CreateChatrooms < ActiveRecord::Migration[6.1]
  def change
    create_table :chatrooms do |t|

      t.integer :admin_id, null: false
      t.integer :student_id, null: false
      t.integer :parent_id, null: false

      t.timestamps
    end
  end
end
