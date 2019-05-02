class CommentsController < ApplicationController
  before_action :set_movie, only: [:create, :destroy]

  def create
    @comment = @movie.comments.create(comment_params)
    if @comment.save
      flash[:notice] = "Comment has been added"
    else
      @comment.errors.full_messages.each do |message|
        flash[:error] = message
      end
    end
    redirect_to movie_path(@movie)
  end

  def destroy
    @comment = @movie.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment has been removed"
    redirect_to movie_path(@movie)
  end
 
  private
    def set_movie
      @movie = Movie.find(params[:movie_id])
    end

    def comment_params
      params.require(:comment).permit(:message).merge(user: current_user)
    end
end
