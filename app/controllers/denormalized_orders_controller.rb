class DenormalizedOrdersController < ApplicationController

  def index
    @demodularized_orders = DenormalizedOrder.all
  end
end