class PostsController < ApplicationController

def top
end

def home
	@user = current_user
	@users = User.where.not(id: current_user.id).limit(5).order("RANDOM()")
	@postm = @user.posts.all.order(id: "DESC").limit(6)
	@posts = Post.where.not(user_id: current_user.id).order(created_at: :desc).page(params[:page])
	@postz = Post.where.not(user_id: current_user.id).order("RANDOM()").page(params[:page])
end

def index
end

def show
	if Post.exists?(id: params[:id])
		@post = Post.find(params[:id])
		@comment = Comment.new
		@posts = @post.user.posts.all.order(id: "DESC").limit(9)
	else
		redirect_to home_path
	end
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
	if Post.exists?(id: params[:id])
		@post = Post.find(params[:id])
		@user = @post.user.id
	else
		redirect_to home_path
	end
end

def update
	@post = Post.find(params[:id])
	@user = @post.user.id
	     if @post.update(post_params)
	       	redirect_to post_path(@post.id)
	    else
	      	render :edit
	    end
end

def destroy
	@post = Post.find(params[:id])
	@post.destroy
	redirect_to home_path
end

private

def post_params
	params.require(:post).permit(:user_id, :image, :post_title, :post_body, :restriction, tags_attributes: [:id, :post_id, :vtuber_id, :_destroy])
end

end
