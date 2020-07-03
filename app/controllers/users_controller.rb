class UsersController < ApplicationController
  def my_portfolio
    @tracked_investments= current_user.investments
  end
end
