class AddTotalInUsdAndColumnsToDenormalizedOrders < ActiveRecord::Migration
  def self.up
    
      add_column :denormalized_orders, :total_in_usd, :decimal
    
      add_column :denormalized_orders, :line_items_sum, :decimal
    
  end
  def self.down
    
      remove_column :denormalized_orders, :total_in_usd
    
      remove_column :denormalized_orders, :line_items_sum
    
  end
end
