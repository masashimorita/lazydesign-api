class CreateConfigurations < ActiveRecord::Migration[6.0]
  def change
    create_table :configurations, id: false do |t|
      t.column :configuration_id, "VARBINARY(128) PRIMARY KEY", null: false
      t.string :configurator_type, null: false
      t.column :configurator_id, "VARBINARY(128)", null: false
      t.string :configuration_key, null: false
      t.text :configuration_value, null: false

      t.timestamps
    end
    add_index :configurations, [:configurator_type, :configurator_id]
  end
end
