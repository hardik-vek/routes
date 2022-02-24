# frozen_string_literal: true
class Business::CustomersController < ApplicationController
  before_action :find_customer, only: [:preview, :edit, :update, :delete_customer]

  def index
    @customers = Customer.all
  end

  def preview
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(create_customers)
    if @customer.save
      flash[:notice] = "Customer successfully created"
      redirect_to business_customers_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @customer.update(create_customers)
      flash[:notice] = "Customer successfully edited"
      redirect_to business_customers_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def delete_customer
    @customer.destroy
    redirect_to business_customers_path
  end

  def search
    @customers = Customer.search(params[:search])
  end

  private

  def create_customers
    params.require(:customer).permit(:fname, :lname, :email, :phone_number)
  end

  def find_customer
    @customer = Customer.find(params[:id])
  end
end
