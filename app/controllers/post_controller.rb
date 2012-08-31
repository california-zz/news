class PostController < ApplicationController
  def index
      if !params[:id].nil?
        @detail = Post.find(params[:id])
        @user = User.find(@detail[:user_id])
      else
        rediect_to root_path
      end

  end

  def create
    @user = User.find(session[:Session_User][:id])
    @post = @user.post.build(params[:post])

    if !params[:post].nil?
      if @post.save
        flash[:success] = "Article created!"
        redirect_to root_path
      else
        flash[:error] = "error!"  
      end
    end
  end

  def edit
   

  end

  def delete
    @post = Post.find(params[:id])
    if @post.destroy
        flash[:success] = "Article deleted"
    end
    redirect_to root_path
  end

end
