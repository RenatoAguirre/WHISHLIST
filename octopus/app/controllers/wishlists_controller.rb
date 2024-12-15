class WishlistsController < ApplicationController
  def index
    @wishlists = Wishlist.all
    render json: @wishlists
  end

  def show
    @wishlist = Wishlist.find(params[:id])
    @products = @wishlist.products
    render json: { wishlist: @wishlist, products: @products }
  end

  def create
    @wishlist = Wishlist.new()
    if @wishlist.save
      render json: @wishlist, status: :created, location: @wishlist
    else
      render json: @wishlist.errors, status: :unprocessable_entity
    end
  end

  def update
    @wishlist = Wishlist.find(params[:id])
    if @wishlist.update()
      render json: @wishlist
    else
      render json: @wishlist.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @wishlist = Wishlist.find(params[:id])
    @wishlist.destroy
    redirect_to wishlists_path
  end
end
