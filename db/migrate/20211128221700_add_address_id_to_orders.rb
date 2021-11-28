class AddAddressIdToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :address_id, :integer
  end
end
