class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end
  
  def create
   @post = Post.new(params.require(:post).permit(:title,:start_date,:end_date,:all_day,:memo))
   if @post.save
    flash[:notice] = "スケジュールを登録しました"
    redirect_to :posts
   else
    flash[:alert] = "スケジュールを登録できませんでした"
    render "new",status: :unprocessable_entity
   end
  end
  
  def show
   @post = Post.find(params[:id])
  end

  def edit
   @post = Post.find(params[:id])
  end
  
  def update
   @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title,:start_date,:end_date,:all_day,:memo))
     flash[:notice] = "スケジュールを更新しました"
     redirect_to :posts
    else
     flash[:alert] = "スケジュールの更新ができませんでした"
     render"edit"
    end
  end
  
  def destroy
   @post = Post.find(params[:id])
   @post.destroy
   flash[:notice] = "スケジュールを削除しました"
   redirect_to :posts
  end
  
end
