class CreateFileTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :file_types do |t|
      t.string  :file_type_name, null: false
      t.string  :file_extension, null: false
    end
  end
end
