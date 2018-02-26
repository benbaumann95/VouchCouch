class CreateVouchers < ActiveRecord::Migration[5.1]
  def change
    create_table :vouchers do |t|
      t.string :name
      t.string :category
      t.integer :price
      t.text :description
      t.date :end_date
      t.integer :quantity_left
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
