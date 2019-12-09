class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags, id: false do |t|
      t.column :tag_id, "VARBINARY(128) PRIMARY KEY", null: false
      t.column :tag_group_id, "VARBINARY(128)", null: false
      t.string :tag_name, null: false

      t.timestamps
    end
  end
end
