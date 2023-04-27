class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new

  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
  end

  def update
    book = Book.find(params[:id])
  
    if book.update(book_params)
      redirect_to book_path(book.id)
      flash[:notice] = "successfully"
    else
     @book = book
     render :edit
    end
  end

  def create

    book = Book.new(book_params)
    if book.save
      flash[:notice] = "successfully"
      redirect_to book_path(book.id)
    else

      @books = Book.all
      @book = book

      render :index
    end

  end

  def show
     @book = Book.find(params[:id])
  end

  def edit
     @book = Book.find(params[:id])
     
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
