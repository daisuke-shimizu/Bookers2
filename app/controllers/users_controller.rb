class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all.order(id: "DESC")
    @user = current_user 
    @book = Book.new
    @books = Book.all
  end
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books

  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to users_path
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end 

  private 
  def user_params
    params.require(:user).permit(:name, :image, :self_intro)
  end
 
  
end
