class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.string :description
      t.integer :total
      t.integer :order_id

      t.timestamps
    end
  end
end
