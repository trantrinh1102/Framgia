class UsersController < ApplicationController
  before_action :load_user, only: [:edit, :update, :show,
    :following, :followers]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "flash.success.Signup"
      login @user
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "flash.success.update"
      redirect_to @user
    else
      render :edit
    end
  end

  def index
    @users = User.search(params[:search]).paginate page: params[:page]
  end

  def following
    @title = t "user.following_title"
    @user  = User.find(params[:id])
    @users = @user.following.paginate page: params[:page]
    render :show_follow
  end

  def followers
    @title = t "user.follower_title"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate page: params[:page]
    render :show_follow
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    if @user.nil?
      flash[:danger] = t "flash.danger.user_not_exist"
      redirect_to root_url
    end
  end

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :phone, :gender
  end
end
