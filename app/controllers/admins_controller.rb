class AdminsController < ApplicationController

def show
	if Admin.exists?(id: params[:id])
		if user_signed_in?
			redirect_to home_path, notice: "無効なURLです。"
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
	if Admin.exists?(id: params[:id])
		if user_signed_in?
			redirect_to home_path, notice: "無効なURLです。"
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
end

def admin_password_edit
	if Admin.exists?(id: params[:id])
		if user_signed_in?
			redirect_to home_path, notice: "無効なURLです。"
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

def admin_params
end

end
