class CreateHomeworks < ActiveRecord::Migration[6.1]
  def change
    create_table :homeworks do |t|

      t.integer :report_id, null: false
      t.string :task

      t.timestamps
    end
  end
end
