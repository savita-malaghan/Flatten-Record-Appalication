class LineItemsController < ApplicationController
  before_action :load_line_items
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  # GET /line_items
  # GET /line_items.json
  def index

    @line_items = @order.line_items.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
    @line_items = @order.line_items.find(params[:id])
  end

  # GET /line_items/new
  def new
    @line_item = @order.line_items.new
  end

  # GET /line_items/1/edit
  def edit
    @line_items = @order.line_items.find(params[:id])
  end

  # POST /line_items
  # POST /line_items.json
  def create
    @line_item = @order.line_items.new(line_item_params)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to [@customer,@order, @line_item], notice: 'Line item was successfully created.' }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to [@customer,@order, @line_item], notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:description, :total, :order_id)
    end

  def load_line_items

    order= params[:order_id].to_i
    customer= params[:customer_id].to_i
    @customer = Customer.find(customer)
    @order = @customer.orders.find(order)


  end
end
