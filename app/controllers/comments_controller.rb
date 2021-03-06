class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin, only: :destroy

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    @user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to product_path(@product, :anchor => "reviews"), notice: 'Review was created successfully.' }
        format.json { render :show, status: :created, location: @product }
        format.js
#       ActionCable.server.broadcast 'product_channel', comment: @comment, average_rating: @comment.product.average_rating
        format.html { redirect_to @product, notice: 'Review was created successfully.' }
      else
        format.html { redirect_to @product, alert: 'Review could not be saved: Please provide your comment and a star rating.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    product = @comment.product
    @comment.destroy
    redirect_to product, notice: 'Review was destroyed successfully.' 
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :body, :rating)
  end

  def authorize_admin
    if current_user.blank? || !current_user.admin?
      redirect_to root_path, alert: 'Admins only!'
    end
  end
end
