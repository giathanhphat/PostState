class StatesController < ApplicationController
	before_action :find_state, only: [:show, :edit, :update, :destroy]
	def index
		
	end

	def new
		@state = State.new
	end

	def create
		@state = State.new(state_params)

		if @state.save
			redirect_to @state
		else
			render 'new'
		end
	end

	def show

	end

	def edit
	end

	def update
		if @state.update(state_params)
			redirect_to @state
		else
			render 'edit'
		end
	end

	def destroy
		@state.destroy
		redirect_to root_path
	end

	private

	def find_state
		@state = State.find(params[:id])
	end

	def state_params
		params.require(:state).permit(:content)
	end
end
