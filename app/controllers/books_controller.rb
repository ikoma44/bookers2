class BooksController < ApplicationController

	before_action :authenticate_user!

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
  # 作成に成功した場合、 /books/{book_id} にリダイレクト
      flash[:notice]="You have created book successfully."
      redirect_to book_path(@book)
    else
  # 作成に失敗した場合、 /books/index に戻してバリデーションエラーを表示する
      @user = current_user
      @books = Book.all
      render :index

    end
  end

 #new.index同一
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
    #@user = User.find(current_user.id)
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  #new.show同一
  def show
    @book = Book.find(params[:id])
		@book_new = Book.new
		@user = @book.user
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      flash[:notice] = "Book was successfully updated."
  	  redirect_to book_path(@book)
    else
  	  render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
