class VtubersController < ApplicationController

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
	if Vtuber.exists?(id: params[:id])
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
	if Vtuber.exists?(id: params[:id])
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

def destroy
end

def vtuber_password_edit
	if Vtuber.exists?(id: params[:id])
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

def vtuber_params
end

end
