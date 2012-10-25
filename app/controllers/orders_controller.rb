class OrdersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @orders }
    end
  end
  def new
    @order = Order.new
    @order.pizzas.build
    respond_to do |format|
      format.html #new.html.erb
      format.json { render :json => @order }
    end
  end
  def create
    @order = Order.new(params[:order])
    respond_to do |format|
      if @order.save
        format.html { redirect_to orders_path, :notice => "Order successfully created" }
        format.json { render :json => @order, :status => :created, :location => @order }
      end
    end
  end
end
