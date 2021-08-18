class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|

      t.timestamps
      
      t.integer :customer
      t.string :name
      t.string :postal_code
      t.string :address
      t.datetime :created_at
      t.datetime :updated_at

    end
  end
end
