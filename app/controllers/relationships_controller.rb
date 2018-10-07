class RelationshipsController < ApplicationController

def create
	Relationship.create(create_params)
	@user = User.find(params[:following_id])
	redirect_to user_path(@user)
end

def destroy

	relationship =  Relationship.find(params[:id])
	@user = relationship.following_id
	relationship.destroy
	redirect_to user_path(@user)
end

private

def create_params
	params.permit(:following_id).merge(follower_id: current_user.id)
end

end
