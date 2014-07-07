class ListsController < ApplicationController
  before_action :set_list, :only => [:edit, :update, :show, :destroy]
  # before_action :authenticate_user

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(list_params)
    redirect_to list_path(@list), notice: "You just added #{@list[:name]}."
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to list_path(@list), notice: "You just updated #{@list[:name]}."
    else
      render "edit"
    end
  end

  def show
  end

  def destroy
    @list.destroy
    redirect_to lists_path, notice: "You deleted #{@list[:name]}."
  end

  protected

  def set_list
    @list = List.find(params[:id])
  end

  # def set_item
  #   @item = Item.find(params[:id])
  # end

  def list_params
    params.require(:list).permit(:name) 
  end
end
