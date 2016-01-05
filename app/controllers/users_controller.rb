class UsersController < ApplicationController

  before_action :authenticate_user!

  before_action :set_user, only: [:show, :edit, :update]

  # GET /users
  def index
  	@users = User.paginate(page: params[:page], :per_page => 6)
  end

  #GET /users/1
  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  	respond_to do |format|
  		if @user.update(user_params)
  			format.html {redirect_to @user, noce: 'User was successfully updated'}
  			format.json {render :show, status: :ok, location: @user}
  		else
  			format.html {render :edit}
  			format.json {render json: @user.errors, status: :unprocessable_entity}
  		end
  	end
  end

  private

  	def set_user
  		@user = User.find(params[:id])
  	end

  	def user_params
  		params.require(:user).permit(:role, :user_name, full_profile_attributes: [:proposal_comments_associations, :interests, :birthdate ])
  	end
end
