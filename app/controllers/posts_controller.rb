class PostsController < ApplicationController
def index
    @posts = Post.all
end

def new
    @post = Post.new
end

def show
    @post = Post.find(params[:id])
end

def edit
@post = Post.find(params[:id])
end

def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
        redirect_to @post
    else
        render 'edit'
    end
end

def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Object successfully created"
      redirect_to @post
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
end

def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path

end
private
def post_params
    params.require(:post).permit(:title,:content)
end

end
