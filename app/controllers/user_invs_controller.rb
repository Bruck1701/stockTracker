class UserInvsController < ApplicationController

  def create
    
    investment = Investment.in_db?(user_inv_params[:symbol],user_inv_params[:type])
    if investment.blank?
      # if the investment is not already on the table.
      investment = Investment.new(symbol:user_inv_params[:symbol],
                                  name:user_inv_params[:name],
                                  investment_type:user_inv_params[:type],
                                  last_price:user_inv_params[:price] )
      investment.save
      action = verify_if_can_track(investment)
    else 
      # if the investment is already on the table, it updates its price 
      if investment.last_price != user_inv_params[:price]
        investment.last_price = user_inv_params[:price]
        investment.save    
        action = "updated in"
        
        if !current_user.has_investment?(investment.symbol,investment.investment_type)
        # verify if the current user already has this investment in her/his porfolio.
        # if it doesn't, it adds the investment to the current user
          action = verify_if_can_track(investment)
        end
      end
    end
    if action
      flash[:notice] = "#{investment.name} was succesfully #{action} your porfolio"
      redirect_to my_portfolio_path
    end
  end

  def destroy
    investment = Investment.find(params[:id])
    user_inv = UserInv.where(user_id: current_user.id, investment_id: investment.id ).first
    user_inv.destroy
    flash[:notice] = "#{investment.investment_type} #{investment.symbol} was successfully removed from portfolio"
    redirect_to my_portfolio_path

  end




  private
  def user_inv_params
    params.permit(:user,:name,:symbol,:price,:type)
  end

  def verify_if_can_track(investment)

    if current_user.can_track_new_investment?
      @user_inv = UserInv.create(user: current_user, investment: investment )
    else
      flash[:danger] = "User can only track 10 investments at a time"
      redirect_to my_portfolio_path and return nil
    end
    "added to"
  end




end
