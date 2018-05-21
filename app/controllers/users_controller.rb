class UsersController < ApplicationController
  
  before_action :find_user, only: [:show, :destroy]
  before_action :user_params, only: [:create]

	def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
    	render 'show'
    end
  end

  def destroy
    @user.destroy

    redirect_to users_path
  end


  private

    def find_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name,:email)
    end
  
end