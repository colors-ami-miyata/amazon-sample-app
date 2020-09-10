class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.text :body
      t.integer :stock
      t.integer :money
      t.integer :user_id
      t.timestamps
    end
  end
end
