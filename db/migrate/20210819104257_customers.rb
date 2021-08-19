class Customers < ActiveRecord::Migration[5.2]
  def change
    drop_table :customers
    
  t.string :last_name
  t.string :first_name
  t.string :last_name_kana
  t.string :first_name_kana
  t.string :email
  t.string :encrypted_password
  t.string :postal_code
  t.string :address
  t.tring :telephone_number
  t.boolean :is_active
  t.datetime :created_at
  t.datetime :updated_at

  end
end
