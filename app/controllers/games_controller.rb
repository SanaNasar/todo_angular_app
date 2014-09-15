class GamesController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]
  # create a before_action that just returns the template
  #   without the layout
  # before_action :render_main_layout_if_format_html

  respond_to :json, :html

  def index
    # respond_with (@items = Item.all)
  end

  def create
    respond_with Item.create(item_params)
  end

  def show
     respond_with @item
  end

  def update
  end

  def destroy
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:title)
    end

    def render_main_layout_if_format_html
      # check the request format
      if request.format.symbol == :html
        render "layouts/application"
      end
  end

end
