class PostsController < ApplicationController
 before_action :authenticate_user!, exist:[:show]
  before_action :set_post, only:[:edit,:update,:destroy,:show]
      
  def new
      @post = Post.new
  end

  def create
    if current_user.function == "Redactor"  
     params[:post][:category_id]=params[:category_id]
        @post = current_user.posts.build(post_params)
        if @post.save
          redirect_to root_path
        else
          render 'new'
        end
      end
  end

  def edit
    
  end

  def update
    @post.update(post_params)
    redirect_to root_path  
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  def show
   @comments=Postscomment.where(post_id: @post.id)
   
  end

  

  def categories
        pp @posts=Post.where(category_id: params[:id])
  end

  private

  def post_params
  pp  params.require(:post).permit(:user_id, :category_id, :title, :body, :description)
  end

  def set_post
    @post=Post.find(params[:id])
  end
end