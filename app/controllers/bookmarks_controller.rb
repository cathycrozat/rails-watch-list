class BookmarksController < ApplicationController
  before_action :set_list,  only: [:new, :create, :destroy]
  before_action :set_bookmark,  only: [:destroy]

  # GET /bookmarks
  def index
    @bookmarks = Bookmark.all
  end



  # GET /bookmarks/new
  def new
    @bookmark = Bookmark.new
  end

  # GET /bookmarks/1/edit
  def edit
  end

  # POST /bookmarks
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list), notice: "bookmark was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bookmarks/1
  # def update
  #   if @bookmark.update(bookmark_params)
  #     redirect_to @bookmark, notice: "bookmark was successfully updated."
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  # DELETE /bookmarks/1
  def destroy
    @bookmark.destroy
    redirect_to list_path(@list), notice: "bookmark was successfully destroyed."
  end


  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end


    # Only allow a bookmark of trusted parameters through.


end
