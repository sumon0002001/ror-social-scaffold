# rubocop:disable Style/IdenticalConditionalBranches

class FriendshipsController < ApplicationController
  include FriendshipsHelper

  def index
    @friendships = Friendship.all
  end

  def create
    @friendship = Friendship.new(friendship_params)

    if @friendship.save
      flash[:notice] = 'Friendship was saved correctly.'
      redirect_to users_path
    else
      render 'new'
    end
  end

  def update
    @friendship = Friendship.find(params[:id])

    if @friendship.update_attributes(friendship_params)
      flash[:notice] = 'Friendship was confirmed correctly.'
      redirect_to users_path
    else
      flash[:notice] = 'Friendship was not modified.'
      redirect_to users_path
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    flash[:notice] = 'Friendship was rejected.'
    redirect_to users_path
  end
end

# rubocop:enable Style/IdenticalConditionalBranches
