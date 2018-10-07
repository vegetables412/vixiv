class CommentsController < ApplicationController

def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post)
end

def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    @posts = @post.user.posts.all.order(id: "DESC").limit(9)
    @comments = Comment.find(params[:comment_id])
    # post = Post.find(params[:post_id])
    # comment = current_user.comments.find_by(post_id: params[:post_id])
    # comment.destroy
    @comments.destroy
    redirect_to post_path(@post)
end

def comment_params
  params.require(:comment).permit(:user_id,
                      :post_id,
                      :comment)
end

end
