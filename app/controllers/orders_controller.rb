class OrdersController < ApplicationController
  before_filter :authenticate_admin_or_user, :except => :index
  before_filter :authenticate_admin!, :only => [ :edit, :update, :destroy ]

  def authenticate_admin_or_user
    is_logged_in = self.admin_signed_in? || self.user_signed_in?
    unless is_logged_in
      flash[:notice] = "Must be logged in"
      redirect_to orders_url
    end
    is_logged_in
  end
  def index
    @orders = Order.all

    respond_to do |format|
      format.html
      format.json { render :json => @orders }
    end
  end
  def new
    @order = Order.new
    @order.pizzas.build
    @toppings_array = []

    respond_to do |format|
      format.html
      format.json { render :json => @order }
    end
  end
  def create
    ingredients = params[:ingredients]
    ingredients_string = ingredients.join ' '
    params[:order][:pizzas_attributes]["0"][:toppings] = ingredients_string
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        format.html { redirect_to orders_url, :notice => "Order successfully created" }
        format.json { render :json => @order, :status => :created, :location => @order }
      end
    end
  end
  def edit
    @order = Order.find(params[:id])
    @toppings_array = @order.pizzas.first.toppings.split ' '

    respond_to do | format|
      format.html
      format.json { render :json => @order }
    end
  end
  def update
    ingredients = params[:ingredients]
    ingredients_string = ingredients.join ' '
    params[:order][:pizzas_attributes]["0"][:toppings] = ingredients_string
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to orders_url, :notice => "Order successfully updated" }
        format.json { render :json => @order, :status => :created, :location => @order }
      end
    end
  end
  def destroy
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.destroy
        format.html { redirect_to orders_url, :notice => "Order successfully deleted" }
      end
    end
  end
  def destroy_all
    orders = Order.all
    orders.each do |order|
      order.destroy
    end
    flash[:notice] = "All orders deleted"
    redirect_to orders_url
  end
end
