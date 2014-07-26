class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    if params[:sort_type] == "recent"
      @articles = Article.all.order(created_at: :desc)
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    # @username = @article.user.username
    @article.user_id = logged_in
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end
end