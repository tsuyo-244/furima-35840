class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string   :postal_code,        null: false
      t.integer  :shipping_origin_id,   null: false
      t.string   :city ,              null: false
      t.string   :street,             null: false
      t.string   :buliding
      t.string   :phone,       null: false
      t.timestamps
      t.references :buy, foreign_key: true
    end
  end
end