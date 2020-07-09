class Users::CommentsController < Users::UsersController
    def create
        byebug
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        redirect_to published_article_path(@article)
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to published_article_path(@article)
    end
     
    private
    def comment_params
        params.require(:comment).permit(:commenter, :body)
    end
end
