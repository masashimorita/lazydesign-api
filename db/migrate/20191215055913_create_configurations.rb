class CreateConfigurations < ActiveRecord::Migration[6.0]
  def change
    create_table :configurations, id: false do |t|
      t.column :configuration_id, "VARBINARY(128) PRIMARY KEY", null: false
      t.references :configurator, polymorphic: true
      t.string :configuration_key, null: false
      t.text :configuration_value, null: false

      t.timestamps
    end
  end
end
