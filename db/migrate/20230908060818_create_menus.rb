class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.integer :hotel_id, null: false
      t.string :title, null: false
      t.integer :price, null: false
      t.text :detail, null: false
      t.boolean :is_available, null: false, default: true

      t.timestamps
    end
  end
end
