class CreateTableDenormalizedOrders < ActiveRecord::Migration
  def self.up
    create_table :denormalized_orders do |t|
      
      t.integer :order_id 
      
      t.string :discount 
      
      t.integer :total 
      
      t.datetime :created_at 
      
      t.datetime :updated_at 
      
      t.integer :customer_id 
      
      t.string :customer_name 
      
      t.datetime :customer_created_at 
      
      t.datetime :customer_updated_at 
      
      t.integer :line_item_id 
      
      t.string :line_item_description 
      
      t.integer :line_item_total 
      
      t.integer :line_item_order_id 
      
      t.datetime :line_item_created_at 
      
      t.datetime :line_item_updated_at 
      
      t.timestamps
    end
  end
  def self.down
    drop_table :denormalized_orders
  end
end
