class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :stripe_customer_id, :string, after: :user_id
    add_column :users, :stripe_card_id, :string, after: :stripe_customer_id
    add_column :users, :image, :string, after: :password_digest
    add_column :users, :tutorial_completed, :boolean, default: false, after: :image
  end
end
