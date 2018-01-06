class Admin::BooksController < ApplicationController
  layout "admin"
  before_action :admin_required

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      #查询单个数据必须传递参数实现检索定位，例如@book
      redirect_to book_path(@book)
    else
      render "new"
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      #查询某数据表所有数据，可以省略传递参数
      redirect_to admin_books_path
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to admin_books_path
  end

  def book_update
    @book = Book.find(params[:id])
    if @book.book_state == "上架"
      @book.update(book_state: "下架")
      flash[:error] = "下架成功"
    else
      @book.update(book_state: "上架")
      flash[:error] = "上架成功"
    end
    redirect_to admin_books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :text, :book_stock, :book_state)
  end
end
