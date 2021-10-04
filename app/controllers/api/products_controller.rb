class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    data = {
      status: true,
      code: 200,
      data: @products
    }
    render json: data
  end

  def show
    @products = Product.find(params[:id])
    data = {
      status: true,
      code: 200,
      data: @products
    }
    render json: data
  end

  def create
    users = User.find(1)
    params[:user_id] = users.id
    @products = Product.new(product_params)

    if @products.save
      ActivateProductJob.set(wait: 1.minutes).perform_later(@products, users)
      data = {
        status: true,
        code: 200,
        data: @products
      }
      render json: data
    else
      data = {
        status: false,
        code: 400,
        message: "Failed to create new product"
      }
      render json: data
    end
  end

  def update
    @products = Product.find(params[:id])
    if @products
      @products.update(product_params)
      data = {
        status: true,
        code: 200,
        message: "Success to update product"
      }
      render json: data
    else
      data = {
        status: false,
        code: 404,
        message: "Cannot find product"
      }
      render json:  data
    end
  end

  def destroy
    @products = Product.find(params[:id])
    if @products
      @products.destroy
      data = {
        status: true,
        code: 200,
        message: "Success to delete product"
      }
      render json: data
    else
      data = {
        status: false,
        code: 404,
        message: "Cannot find product"
      }
      render json: data
    end
  end

  private

  def product_params
    params.permit(:user_id, :name, :price, :category, :images)
  end
end