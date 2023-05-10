class BooksController < ApplicationController
  def new
     # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @book =Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] ="Book was successfully created."
    else
     render :new
    end
    #book.save
    #redirect_to "/books/#{book.id}"
  end

  def index
    @books = Book.all

    @books = Book.all.order(id: :desc)  

    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

 def update
  @book = Book.find(params[:id])
  if  @book.update(book_params)
   redirect_to book_path(@book.id)
   flash[:message] ="Book was successfully update"
  else
   render:edit
  end
 end

 def destroy
  book= Book.find(params[:id])
  book.destroy
  redirect_to '/books'
 end

 private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
 end
