# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy confirm]
  helper_method :current_user
  
  # GET /orders
    # GET /orders.json
    def index
      @orders = Order.all
    end
  
    # GET /orders/1
    # GET /orders/1.json
    def show
    end
  
    # GET /orders/new
    def new
      @order = Order.new
    end
  
    # GET /orders/1/edit
    def edit
    end
  
    # POST /orders
    # POST /orders.json
    def create
      @order = Order.new(order_params)
  
      respond_to do |format|
        if @order.save
          format.html { redirect_to @order, notice: 'Order was successfully created.' }
          format.json { render :show, status: :created, location: @order }
        else
          format.html { render :new }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /orders/1
    # PATCH/PUT /orders/1.json
    def update
      respond_to do |format|
        if @order.update(order_params.merge(status: "submitted amin"))
          format.html { redirect_to confirm_order_path(@order), notice: 'Order was successfully updated.' }
          # format.json { render :show, status: :ok, location: @order }
          format.json { head :no_content }
        else
          format.html { render :edit }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /orders/1
    # DELETE /orders/1.json
    def destroy
      @order.destroy
      respond_to do |format|
        format.html { redirect_to products_path }
        format.json { head :no_content }
      end
      # redirect_to product_path
    end

    def confirm; end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_order
        @order = Order.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def order_params
        params.require(:order).permit(:user_id, :status, :address_id)
      end
  end
