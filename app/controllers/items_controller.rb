class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(params.require(:item).permit(:name, :quantity, :description) )
    redirect_to items_path, notice: "You just added #{@item[:name]} to the shopping list."
  end

  def edit
    @item = Item.find(params[:id])

  end

  def update
    @item = Item.find(params[:id])
    if @item.update(params.require(:item).permit(:name, :quantity, :description) )
      redirect_to items_path, notice: "You just updated #{@item[:name]}."
    else
      render "edit"
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path, notice: "You bought #{@item[:name]}. Thank you!"
  end
end
