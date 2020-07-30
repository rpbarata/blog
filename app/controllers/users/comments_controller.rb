class Users::CommentsController < Users::UsersController

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params.merge(user_id: current_user.id))
    redirect_to published_article_path(@article, anchor: "comments_sections")
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to published_article_path(@article)
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end

end
