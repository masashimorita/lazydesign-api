class CreateConfigurationTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :configuration_types do |t|
      t.string  :configuration_type_name
    end
  end
end
