class RemoveConfigurationTypes < ActiveRecord::Migration[6.0]
  def change
    drop_table :configuration_types
  end
end
