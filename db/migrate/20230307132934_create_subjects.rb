class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|

      t.string :subject_name, null: false

      t.timestamps
    end
  end
end
