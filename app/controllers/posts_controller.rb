class PostsController < ApplicationController

def top
end

def home
	if user_signed_in?
		@user = current_user
		@users = User.where.not(id: current_user.id).limit(8).order("RANDOM()")
		@postm = @user.posts.all.order(id: "DESC").limit(6)
		@posts = Post.where.not(user_id: current_user.id).order(created_at: :desc).page(params[:page])
		@postz = Post.where.not(user_id: current_user.id).order("RANDOM()").page(params[:page])
	elsif vtuber_signed_in?
		@vtuber = current_vtuber
	elsif admin_signed_in?
		@admin = current_admin
	else
		redirect_to new_user_session_path
	end
end

def index
	if user_signed_in?
		redirect_to home_path, notice: "無効なURLです。"
	elsif vtuber_signed_in?
	elsif admin_signed_in?
	else
		redirect_to new_user_session_path
	end
end

def show
	if Post.exists?(id: params[:id])
		@post = Post.find(params[:id])
		@comment = Comment.new
		@posts = @post.user.posts.all.order(id: "DESC").limit(9)
	else
		redirect_to home_path, notice: "無効なURLです。"
	end
end

def new
	if user_signed_in?
		@user = current_user.id
		@post = Post.new
		@tag = @post.tags.build
	elsif vtuber_signed_in?
	elsif admin_signed_in?
	else
		redirect_to new_user_session_path
	end
end

def create
	@user = current_user.id
	@post = Post.new(post_params)
	if @post.save
		redirect_to home_path
	else
		flash[:notice] = "＊タイトルは最大25文字で、必ず入力しなければいけません。"
		render :new
	end
end

def edit
	if Post.exists?(id: params[:id])
		if user_signed_in?
			@post = Post.find(params[:id])
			@user = @post.user.id
		elsif vtuber_signed_in?
			redirect_to home_path, notice: "無効なURLです。"
		elsif admin_signed_in?
		else
			redirect_to new_user_session_path
		end
	else
		redirect_to home_path, notice: "無効なURLです。"
	end
end

def update
	@post = Post.find(params[:id])
	@user = @post.user.id
	     if @post.update(post_params)
	       	redirect_to post_path(@post.id)
	    else
	    	flash[:notice] = "＊タイトルは最大25文字で、必ず入力しなければいけません。"
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
