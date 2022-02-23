class OrdersController < ApplicationController
  before_action :get_product
  before_action :find_order, only: [:show, :edit, :update, :destroy]

  def index
    # @orders = Order.all
    @orders = @product.orders
  end

  def show
  end

  def new
    # @order = Order.new
    @order = @product.orders.build
  end

  def create
    @order = @product.orders.build(create_orders)
    if @order.save
      flash[:notice] = "Order has been successfully created......"
      redirect_to product_orders_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @order.update(create_orders)
      flash[:notice] = "Order has been successfully edited......."
      redirect_to product_orders_path(@product)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy
    redirect_to product_orders_path(@product)
  end

  private

  def get_product
    @product = Product.find(params[:product_id])
  end
  def find_order
    @order = @product.orders.find(params[:id])
  end

  def create_orders
    params.require(:order).permit(:quantity, :total_price, :product_id)
  end
end
