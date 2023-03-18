class AddIsCompletedToHomework < ActiveRecord::Migration[6.1]
  def change
    add_column :homeworks, :is_completed, :boolean, default: false
  end
end
