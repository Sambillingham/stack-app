class VotesController < ApplicationController

	def create
		@vote = Vote.new(story_id: params[:story_id])
		# could use update attibutes instead
		@vote.ip_address = request.ip
		@vote.save
		redirect_to root_path(filter: "popular")
	end
		
	def destroy
		@story = Story.find(params[:story_id])
		@vote = @story.votes.last()
		@vote.delete
		redirect_to root_path(filter: "popular")
	end
end
