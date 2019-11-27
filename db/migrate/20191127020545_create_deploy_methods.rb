class CreateDeployMethods < ActiveRecord::Migration[6.0]
  def change
    create_table :deploy_methods, primary_key: :deploy_method_id do |t|
      t.string  :deploy_method_name, null: false
      t.string  :deploy_program, null: false
      t.string  :entry_point, null: false
    end
  end
end
