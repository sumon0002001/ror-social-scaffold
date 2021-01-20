class FriendshipsController < ApplicationController
  def new
    @friendship = Friendship.new
  end

  def create
    Friendship.create(user_id: params[:user_id], friend_id: params[:friend_id])
    flash[:notice] = 'Friendship was saved correctly.'
    redirect_to users_path
  end

  def update
    @user = User.find(params[:id])
    @friend = Friendship.find_by(user_id: params[:user_id], friend_id: params[:friend_id])
    @friend.update(status: true)
    flash[:notice] = 'Friendship was confirmed correctly.'
    redirect_to user_path
  end

  def destroy
    @friend = Friendship.find_by(user_id: params[:user_id], friend_id: params[:friend_id])
    @friend.destroy
    flash[:notice] = 'Friendship was rejected.'
    redirect_to user_path
  end
end
