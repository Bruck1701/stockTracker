class InvestmentsController < ApplicationController

  def search

    if params[:investment].present?

      coin = crypto_currency_list.select{|coin| coin["symbol"] == params[:investment].downcase}
      
      if coin.any?
        @crypto = Investment.new_lookup(coin.first["name"],coin.first["symbol"],"Cryptocurrency")
      end
      
      @stock = Investment.new_lookup("",params[:investment],"Stock")
      

      if @crypto.nil? && @stock.nil?
        respond_to do |format|
        flash.now[:alert] = "Please enter a valid symbol to search"
        format.js {render partial: 'users/result'}
        end
        
      else
        respond_to do |format|
          format.js {render partial: 'users/result' }
      end
    end
      
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a symbol to search"
        format.js {render partial: 'users/result'}
      end
    end
  

  end


  # private
  # def investment_params
  #   params.require(:investment).permit(:)
  # end


end