class PostsController < ApplicationController

def top
end

def home
	@user = current_user
end

def index
end

def show
	@post = Post.find(params[:id])
	@comment = Comment.new
end

def new
	@user = current_user.id
	@post = Post.new
	@tag = @post.tags.build
end

def create
	@user = current_user.id
	@post = Post.new(post_params)
	@post.save
	redirect_to home_path
end

def edit
end

def update
end

def destroy
end

private

def post_params
	params.require(:post).permit(:user_id, :image, :post_title, :post_body, :restriction, tags_attributes: [:id, :post_id, :vtuber_id, :_destroy])
end

end
