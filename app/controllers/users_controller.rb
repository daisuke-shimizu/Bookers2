class UsersController < ApplicationController
  def index
    @users = User.all.order(id: "DESC")
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
