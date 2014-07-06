class ItemsController < ApplicationController
  before_action :set_list

  def index
    @items = @list.items
  end

  def new
    @item = @list.items.new
  end

  def create
    @item = @list.items.create(item_params)
    redirect_to list_path(@list), notice: "You just added #{@item[:name]} to the shopping list."
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to list_path(@list), notice: "You just updated #{@item[:name]}."
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
    redirect_to list_path(@list), notice: "You bought #{@item[:name]}. Thank you!"
  end

  def item_params
    params.require(:item).permit(:name, :quantity, :description) 
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
