class ItemsController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show, :search]
  # before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    # @items = Item.all.order('created_at DESC')
  end

end
