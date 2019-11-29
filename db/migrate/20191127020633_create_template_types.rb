class CreateTemplateTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :template_types do |t|
      t.string  :template_type_name, null: false
    end
  end
end
