class CommentsController < ApplicationController
  def new
    @story = Story.find(params[:story_id])
  	@comment = Comment.new
  end

  def create
    @story = Story.find(params[:story_id])
  	@comment = @story.comments.new(comment_params)

  	if @comment.save
		  flash[:success] = "Yay, that worked!"
		  redirect_to story_path(@story)
	 else
		  flash[:error] = "Boo, Something went wrong, try again!"
		  render :new
	end

  end

  def edit
  	@comment = Comment.find(params[:id])
  end

  private
	def comment_params
		# Only the data I whitelist is allowed
		params.require(:comment).permit(:body, :story_id)
	end

end
