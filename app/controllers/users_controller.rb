class UsersController < ApplicationController
  def my_portfolio
    @user = current_user
    @tracked_investments= current_user.investments
  end

  def show
    @user = User.find(params[:id])
    @tracked_investments = @user.investments
  end



  def friends
    @friends = current_user.friends
  end

  def search
    if params[:friend].present?
      @friends = User.search(params[:friend])
      @friends = current_user.except_current_user(@friends)

      if @friends
        respond_to do |format| 
          format.js { render partial: 'users/friend_result'}
        end

      else
        respond_to do |format|
          flash.now[:alert] = "Couldn't find user"
          format.js { render partial: 'users/friend_result'}
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = "Enter a name or email to search"
        format.js { render partial: 'users/friend_result'}
      end
    end
  end
end