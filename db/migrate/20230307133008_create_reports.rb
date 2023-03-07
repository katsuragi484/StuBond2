class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|

      t.integer :teacher_id, null: false
      t.integer :student_id, null: false
      t.integer :subject_id, null: false
      t.boolean :is_parent_read, null: false, default: false
      t.string :title, null: false
      t.text :body, null: false
      t.text :comment

      t.timestamps
    end
  end
end
