class PostsController < ApplicationController

def top
end

def home
	
end

def index
end

def show
	@post = Post.find(params[:id])
	@comment = Comment.new
end

def new
end

def create
end

def edit
end

def update
end

def destroy
end

private

def post_params
end

end
