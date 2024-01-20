class BookmarksController < ApplicationController
  before_action :set_list


  def new
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.build
    @movies = Movie.all
  end

  def create
    @bookmark = @list.bookmarks.build(bookmark_params)
    @bookmark.save
    redirect_to list_path(@list)
  end

  def destroy
    @bookmark = @list.bookmarks.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
