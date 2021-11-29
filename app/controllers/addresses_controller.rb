# frozen_string_literal: true

class AddressesController < ApplicationController
  before_action :set_address, only: %i[show edit update destroy]
  helper_method :current_user
  before_action :load_order, only: :create

  # GET /addresses or /addresses.json
  def index
    @addresses = Address.all
  end

  # GET /addresses/1 or /addresses/1.json
  def show; end

  # GET /addresses/new
  def new
    @address = Address.new
  end

  # GET /addresses/1/edit
  def edit; end

  # POST /addresses or /addresses.json
  def create
    @address = current_user.addresses.build(address_params)
    @address.user_id = current_user.id

    respond_to do |format|
      if @address.save
        format.html { redirect_to @order, notice: 'Address was successfully created.' }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addresses/1 or /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to @address, notice: 'Address was successfully updated.' }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1 or /addresses/1.json
  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to addresses_url, notice: 'Address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def address_params
    params.require(:address).permit(:line1, :line2, :city, :state, :zip, :user_id, :order_id)
  end
end
