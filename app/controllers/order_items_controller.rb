class OrderItemsController < ApplicationController
  before_action :set_order_item, only: %i[ show edit update destroy ]
  before_action :load_order, only: :create
  

  # GET /order_items or /order_items.json
  def index
    @order_items = OrderItem.all
  end

  # GET /order_items/1 or /order_items/1.json
  def show
  end

  # GET /order_items/new
  def new
    @order_item = OrderItem.new
  end

  # GET /order_items/1/edit
  def edit
  end

  # POST /order_items or /order_items.json
  def create
    @order_item = OrderItem.new(product_id: params[:product_id], order_id: @order.id)

    respond_to do |format|
      if @order_item.save
        format.html { redirect_to @order, notice: "Successfully added product to cart." }
        format.json { render :show, status: :created, location: @order_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_items/1 or /order_items/1.json
  def update
    respond_to do |format|
      if @order_item.update(order_item_params)
        format.html { redirect_to @order_item, notice: "Order item was successfully updated." }
        format.json { render :show, status: :ok, location: @order_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_items/1 or /order_items/1.json
  def destroy
    @order_item.destroy
    respond_to do |format|
      format.html { redirect_to order_items_url, notice: "Order item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

  # Only allow a list of trusted parameters through.
  def order_item_params
    params.require(:order_item).permit(:product_id, :order_id, :quantity)
  end

  def load_order
    @order = Order.find_or_initialize_by_id(session[:order_id], status: "unsubmitted")
    if @order.new_record?
      @order.save!
      session[:order_id] = @order.id
    end
  end
end
