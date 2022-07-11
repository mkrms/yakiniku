class ItemsController < ApplicationController
  before_action :find_item,  only: [:show, :edit, :update, :destroy]
  before_action :result_sort,  only: [:index]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :value)
  end

  def result_sort
    input_file = File.open('../sampleapp/result.txt')
    output_file = File.basename('result_sort.txt')
    
    File.open input_file do |i_file|
      File.open output_file, 'w' do |o_file|
        o_file.puts i_file.read.split(/\s+/).sort.reverse
      end
    end
  end
end
