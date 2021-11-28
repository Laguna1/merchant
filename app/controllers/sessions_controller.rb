# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :load_order, only: :create

  def create
    @user = User.find_or_create_by_auth(request.env['omniauth.auth'])
    load_order
    session[:user_id] = @user.id
    @order.update(user: @user)
    redirect_to products_path, notice: "Logged in as #{@user.name}"
  end

  def destroy
    session.destroy
    session[:user_id] = nil
    session[:order_id] = nil
    redirect_to root_path, notice: 'Goodbye!!!'
  end
end
