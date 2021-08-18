class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|

      t.timestamps
      
      t.integer :order
      t.integer :item
      t.integer :price
      t.integer :amount
      t.integer :making_status
      t.datetime :created_at
      t.datetime :updated_at
      
    end
  end
end
