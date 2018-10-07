class UsersController < ApplicationController

def index
	if user_signed_in?
		redirect_to home_path, notice: "無効なURLです。"
	elsif vtuber_signed_in?
		redirect_to home_path, notice: "無効なURLです。"
	elsif admin_signed_in?
	else
		redirect_to new_user_session_path
	end
end

def show
	if User.exists?(id: params[:id])
		if user_signed_in?
			@user = User.find(params[:id])
		elsif vtuber_signed_in?
		elsif admin_signed_in?
		else
			redirect_to new_user_session_path
		end
	else
		redirect_to home_path, notice: "無効なURLです。"
	end
end

def edit
	if User.exists?(id: params[:id])
		if user_signed_in?
			@user = User.find(params[:id])
		elsif vtuber_signed_in?
		elsif admin_signed_in?
		else
			redirect_to new_user_session_path
		end
	else
		redirect_to home_path, notice: "無効なURLです。"
	end
end

def update
	@user = User.find(params[:id])
	if @user.update(user_params)
		redirect_to user_path(@user.id)
	else
		redirect_to user_path(@user.id)
	end
end

def destroy
end

def user_password_edit
	if User.exists?(id: params[:id])
		if user_signed_in?
			@user = User.find(params[:id])
		elsif vtuber_signed_in?
		elsif admin_signed_in?
		else
			redirect_to new_user_session_path
		end
	else
		redirect_to home_path, notice: "無効なURLです。"
	end
end

def user_posts_index
	if User.exists?(id: params[:id])
		if user_signed_in?
			@user = User.find(params[:id])
			@posts = @user.posts.all.order(id: "DESC")
		elsif vtuber_signed_in?
		elsif admin_signed_in?
		else
			redirect_to new_user_session_path
		end
	else
		redirect_to home_path, notice: "無効なURLです。"
	end
end

def following
	if User.exists?(id: params[:id])
		if user_signed_in?
			@user  = User.find(params[:id])
			@users = @user.following
			render 'users/follow/show_follow'
		elsif vtuber_signed_in?
		elsif admin_signed_in?
		else
			redirect_to new_user_session_path
		end
	else
		redirect_to home_path, notice: "無効なURLです。"
	end
end

def followers
	if User.exists?(id: params[:id])
		if user_signed_in?
			@user  = User.find(params[:id])
			@users = @user.followers
			render 'users/follow/show_follower'
		elsif vtuber_signed_in?
		elsif admin_signed_in?
		else
			redirect_to new_user_session_path
		end
	else
		redirect_to home_path, notice: "無効なURLです。"
	end
end

private

def user_params
	params.require(:user).permit(:name, :email, :password, :profile_image, :introduction)
end

end
