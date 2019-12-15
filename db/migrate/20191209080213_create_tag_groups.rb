class CreateTagGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :tag_groups, id: false do |t|
      t.column :tag_group_id, "VARBINARY(128) PRIMARY KEY", null: false
      t.string :group_name

      t.timestamps
    end
  end
end
