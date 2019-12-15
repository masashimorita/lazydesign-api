class CreateDomains < ActiveRecord::Migration[6.0]
  def change
    create_table :domains, id: false do |t|
      t.column :domain_id, "VARBINARY(128) PRIMARY KEY", null: false
      t.column :user_id, "VARBINARY(128)", null: false
      t.column :project_id, "VARBINARY(128)", null: false
      t.string :domain_name, null: false, unique: true

      t.timestamps
    end
    add_foreign_key :domains, :users, primary_key: :user_id, column: :user_id
    add_foreign_key :domains, :projects, primary_key: :project_id, column: :project_id
  end
end
