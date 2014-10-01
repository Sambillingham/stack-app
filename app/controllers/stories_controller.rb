class StoriesController < ApplicationController
	def index

		if params[:sort] == "recent"
			@stories = Story.order(created_at: :desc)
		elsif params[:filter] =="popular"
			@stories = Story.order(votes_count: :desc)
		elsif params[:filter] =="featured"
			@stories = Story.where(is_featured: true)
		else
			@stories = Story.order(created_at: :desc)
		end

	end

	def new
		@story = Story.new
	end

	def show
		@story = Story.find(params[:id])
		@comments = @story.comments
	end
	
	def create
		@story = Story.new(story_params)
		if @story.save
			flash[:success] = "Yay, that worked!"
			redirect_to root_path
		else
			flash[:error] = "Boo, Something went wrong, try again!"
			render :new
		end
	end

	def edit
		@story = Story.find(params[:id])
	end

	def update
		@story = Story.find(params[:id])

		if @story.update(story_params)
			flash.now[:success] = "Yay, that update worked!"
			redirect_to story_path(@story)
		else
			flash.now[:error] = "Boo, Something went wrong, no update try again!"
			render :new
		end
	end

	def destroy
		@story = Story.find(params[:id])

		@story.delete
		flash[:success] = "Deleted...."
		redirect_to root_path
	end

	private
	def story_params
		# Only the data I whitelist is allowed
		params.require(:story).permit(:title, :body, :url, :is_featured)
	end
end
