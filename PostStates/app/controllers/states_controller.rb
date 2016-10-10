class StatesController < ApplicationController
	before_action :find_state, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]
	def index
		@states = State.all.order("created_at DESC")
		@states = State.where(["name LIKE ?", "%#{params[:search]}%"])
	end

	def new
		@state = current_user.states.build
		respond_to do |format|
			format.html
			format.js # render states/new.js.erb
		end
	end

	def create
		@state = current_user.states.build(state_params)

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
		params.require(:state).permit(:name, :content)
	end
end
