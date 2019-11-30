class ModifyUserIdColumnType < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :id, :binary, limit: 128, null: false
  end
end
