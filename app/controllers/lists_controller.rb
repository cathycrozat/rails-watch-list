class ListsController < ApplicationController

  before_action :set_list, only: [ :show, :destroy]

  # GET /lists
  def index
    @lists = List.all
  end

  # GET /lists/1
  def show
    @bookmark = Bookmark.new
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to list_path(@list), notice: "list was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end


  # DELETE /lists/1
  def destroy
    @list.destroy
    redirect_to lists_url, notice: "list was successfully destroyed."
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def list_params
    params.require(:list).permit(:name, :photo)
  end

end
