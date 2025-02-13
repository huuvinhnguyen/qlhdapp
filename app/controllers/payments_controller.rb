class PaymentsController < ApplicationController
    before_action :set_payment, only: [:destroy, :show, :edit]
    
    def index
        @payments = Payment.all
    end
    def new
      @payment = Payment.new
      @payment.transactions.build # Tạo giao dịch mới trong form

    end
  
    def create
      Rails.logger.debug "Received params: #{params.inspect}"
      @payment = Payment.new(payment_params)
    
      if @payment.save
        redirect_to payments_path, notice: "Payment was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end
    

    def destroy
        @payment = Payment.all.find(params[:id])  # Find the payment
        @payment.destroy
        redirect_to payments_path(@payments), notice: 'Payment was successfully deleted.'

      end
  
    private
  
    def set_contract
      @contract = Contract.find(params[:contract_id])
    end

    def set_payment
        @payment = Payment.all.find(params[:id])
    end
  
    def payment_params
      params.require(:payment).permit(:name, :product_name, :amount, :payment_date, :status_id, :contract_id,
      transactions_attributes: [:amount, :exchange_rate, :vnd_value, :source]
      )
    end
end
  