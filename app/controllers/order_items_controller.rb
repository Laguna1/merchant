# frozen_string_literal: true

class OrderItemsController < ApplicationController
  before_action :set_order_item, only: %i[show edit destroy]
  before_action :load_order, only: :create
  # GET /order_items/1/edit
  def edit; end

  # POST /order_items
  # POST /order_items.json
  def create
    # @order_item = OrderItem.new(order_item_params)
    # @order_item = OrderItem.new(product_id: params[:product_id], order_id: @order.id)
    # @order_item = @order.order_items.new(quantity: 1, product_id: params[:product_id])
    @order_item = @order.order_items.find_or_initialize_by(product_id: params[:product_id])
    @order_item.quantity += 1

    respond_to do |format|
      if @order_item.save
        # format.html { redirect_to @order_item, notice: 'Order item was successfully created.' }
        format.html { redirect_to @order, notice: 'Successfully added product to cart.' }
        format.json { render :show, status: :created, location: @order_item }
      else
        format.html { render :new }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_items/1
  # PATCH/PUT /order_items/1.json
  def update
    @order_item = OrderItem.find(params[:id])
    respond_to do |format|
      if order_item_params[:quantity].to_i.zero?
        @order_item.destroy
        format.html { redirect_to @order_item.order, notice: 'Order item is removed from cart.' }
        format.json { head :no_content }
      elsif @order_item.update(order_item_params)
        format.html { redirect_to order_url(session[:order_id]), notice: 'Quantity was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_item }
      else
        format.html { render :edit }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    @order_item.destroy
    respond_to do |format|
      format.html { redirect_to order_url(session[:order_id]), notice: 'Order item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order_item
    @order_item = OrderItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_item_params
    params.require(:order_item).permit(:product_id, :order_id, :quantity)
  end
end
