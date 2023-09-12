class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :mail, null: false
      t.text :message, null: false
      t.boolean :is_support, null: false, default: true

      t.timestamps
    end
  end
end
