class AddPhotoToVouchers < ActiveRecord::Migration[5.1]
  def change
    add_column :vouchers, :photo, :string
  end
end
