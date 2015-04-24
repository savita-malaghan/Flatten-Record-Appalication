class Order < ActiveRecord::Base
  belongs_to :customer
  has_many  :line_items

  def total_in_usd

  end
end
