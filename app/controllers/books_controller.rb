class BooksController < ApplicationController
  def new　
    @book = Book.new

  end

  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "successfully! it has uploaded."
      redirect_to book_path(@book)
    else
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
  end


  def index
    @book = Book.new
    @books = Book.all.order(id: "DESC")
    
  end
  def start
  end
  def edit
    @book = Book.find(params[:id]) 
  end
  def update
    @book = Book.find(params[:id])
    @book.update(books_params)
    redirect_to book_path(@book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
    def books_params
        params.require(:book).permit(:title, :opinion)
    end

end