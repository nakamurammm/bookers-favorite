class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @book_comment = current_user.book_comments.new(book_comment_params)
    @book_comment.book_id = @book.id
     @book_comments = @book.book_comments
    if @book_comments.save
      redirect_to book_path(book)
    else
      render 'show'
    end
  end

  def destroy
      @book_comments = @book.book_comments
    @book_comments.destroy
    redirect_to books_path
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
