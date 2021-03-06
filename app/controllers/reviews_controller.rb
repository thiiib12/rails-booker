class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @book = Book.find(params[:book_id])
  end

  def create
    @review = Review.new(review_params)
    @book = Book.find(params[:book_id])
    @review.book = @book
    @review.user = current_user
    if @review.save
      redirect_to book_path(@book)
    else
      render 'books/show'
    end
  end

  def destroy
    book = Review.find(params[:id]).book
    Review.find(params[:id]).destroy
    redirect_to book_path(book)
  end

  def edit
    @review = Review.find(params[:id])
    @book = Book.find(params[:book_id])
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to book_path(params[:book_id])
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
