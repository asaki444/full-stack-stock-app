class TransactionsController < ApplicationController
    include CurrentUserConcern
    
    def create
        @current_user = User.find(params["transaction"]["id"])

        if @current_user
            balance = @current_user.account_balance - params["transaction"]["purchase_amount"]
            if balance > 0  
               @current_user.update(account_balance: balance)
               symbol = params["transaction"]["stock_symbol"]
               purchase_amount = params["transaction"]["purchase_amount"]
               amount_of_stock = params["transaction"]["amount_of_stock"]

               stock = Stock.find_or_create_by(stock_symbol: symbol)
                
               if stock.amount_of_stock
                stock.update(amount_of_stock: stock.amount_of_stock + amount_of_stock)
               else
                stock.update(amount_of_stock: amount_of_stock)
               end

               Transaction.create(user: @current_user, stock: stock, 
                purchase_amount: purchase_amount, 
                amount_of_stock: amount_of_stock,
                stock_symbol: symbol)
              
                render json: {
                   message: "purchase successful",
                   balance: @current_user.account_balance,
                   stocks: @current_user.stocks.uniq,
                   transactions: @current_user.transactions
               }
            else
                render json: {
                    status: 405,
                    message: "Cannot process request due to insufficient funds" 
                }
            end

        else 
            render json: {
                status: 405,
                message: "User must log in"
            }
        end
    end

    private

    def transaction_params
      params.require(:transaction).permit(:stock, :stock_symbol, :amount_of_stock, :user)
    end

end