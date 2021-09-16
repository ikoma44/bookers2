class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to '/'
  end
  
  def index
    @book = Book.new
    @books = Book.all
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  #new.show同一にする。
  def show
    @book = Book.new
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
  end
  
  def destroy
  end
  
  
  private
  def book_params
    params.require(:book).permit(:title, :opinion)
  end
  
end
