class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def add_to_borrow
    @book = Book.find(params[:id])
    if !current_borrow.books.include?(@book)
      current_borrow.add_book_to_borrow(@book)
      @book.book_stock = @book.book_stock - 1
      @book.save

      flash[:notice] = "成功将 #{@book.title} 加入借书单"
    else
      flash[:waning] = "你的借书单已有本书"
    end
    redirect_to books_path
  end

  def return_book
    @borrow_item = BorrowItem.find(params[:id])
    if @borrow_item.destroy
      @borrow_item.book.book_stock = @borrow_item.book.book_stock + 1
      @borrow_item.book.save
      redirect_to borrows_path
      flash[:notice] = "还书成功"
    else
      flash[:error] = "还书失败"
    end
  end
end
