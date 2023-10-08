class CreateStars < ActiveRecord::Migration[6.1]
  def change
    create_table :stars do |t|
      t.integer :customer_id, null: false
      t.integer :menu_id, null: false
      t.float :star, null: false, default: 0.0
      
      t.timestamps
    end
  end
end

