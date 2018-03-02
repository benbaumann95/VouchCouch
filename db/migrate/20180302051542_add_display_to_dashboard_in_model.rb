class AddDisplayToDashboardInModel < ActiveRecord::Migration[5.1]
  def change
    add_column :vouchers, :display_flag, :boolean, default: true
    add_column :bookings, :display_flag, :boolean, default: true
  end
end
