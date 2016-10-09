class CommentsController < ApplicationController
	def create
		@state = State.find(params[:state_id])
		@comment = @state.comments.create(params[:comment].permit(:comment))
		@comment.user_id = current_user.id if current_user
		if @comment.save
			respond_to do |format|
			format.html {redirect_to state_path(@state)}
			format.js # render comments/create.js.erb
		end
		else
			render 'new'
		end
	end

	def edit
		@state = State.find(params[:state_id])
		@comment = @state.comments.find(params[:id])
	end

	def update
		@state = State.find(params[:state_id])
		@comment = @state.comments.find(params[:id])

		if @comment.update(params[:comment].permit(:comment))
			redirect_to state_path(@state)
		else
			render 'edit'
		end
	end

	def destroy
		@state = State.find(params[:state_id])
		@comment = @state.comments.find(params[:id])
		@comment.destroy
		redirect_to state_path(@state)
	end
end
