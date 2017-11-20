class ReviewsController < ApplicationController
  before_action :set_country
  # before_action :skip_pundit?

  def new
   @review = Review.new
   authorize @review
  end

  def create
    @review = Review.new(review_params)
    authorize @review
    @review.country = @country
    if @review.save
      redirect_to country_path(@country)
    else
      render :new
    end
  end

  private
  def set_country
    @country = Country.find(params[:country_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
