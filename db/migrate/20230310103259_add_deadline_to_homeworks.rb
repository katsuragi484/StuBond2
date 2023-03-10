class AddDeadlineToHomeworks < ActiveRecord::Migration[6.1]
  def change
    add_column :homeworks, :deadline, :date, null: false
  end
end
