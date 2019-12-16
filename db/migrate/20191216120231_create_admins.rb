class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins, id: false do |t|
      t.column :admin_id, "VARBINARY(128) PRIMARY KEY", null: false
      t.string :name, null: false
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false
      t.boolean :is_super_admin, default: false

      t.timestamps
    end
  end
end
