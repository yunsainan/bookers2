class BooksController < ApplicationController
  def new
   @book = Book.new
  end

  def create
   @book = Book.new(book_params)
   @book.user_id = current_user.id
   if @book.save
   redirect_to books_path
   else
     render :new
   end
  end

  def index
   @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end

  private

  def book_params
    params.require(:book).permit(:title, :image, :body)
  end
  
　def correct_user
　  @book = Book.find(params[:id])
    @user = @book.user
    redeirect_to(books_path) unless @user == current_user
  end
  end