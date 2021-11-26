class AddStockToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :stock, :integer, default: 0
  end
end
