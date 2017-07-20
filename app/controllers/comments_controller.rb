class CommentsController < ApplicationController
  # http_basic_authenticate_with name: 'dhh', password: 'secret', only: :destroy
  def create
    @article = Article.find(params[:article_id])
    # @comment = @article.comments.create(comment_params)
    @comment = @article.comments.create
    @comment.user_id = current_user.id
    @comment.commenter = current_user.email
    @comment.body = comment_params[:body]
    @comment.save
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    authorize @comment
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
