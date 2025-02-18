class PaymentsController < ApplicationController
    before_action :set_payment, only: [:destroy, :show, :edit, :update]
    
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

    def update
      if @payment.update(payment_params)
        @payment.transactions.each do |transaction|
          if transaction.amount.present? && transaction.exchange_rate.present?
            transaction.update(vnd_value: transaction.amount * transaction.exchange_rate)
          end
        end
    
        redirect_to @payment, notice: "Payment was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end
    
    
    def destroy
        @payment = Payment.all.find(params[:id])  # Find the payment
        @payment.destroy
        redirect_to payments_path(@payments), notice: 'Payment was successfully deleted.'

    end

    def manufactures
      @payments_by_manufacture = Payment.includes(contract: :manufacture).group_by { |p| p.contract&.manufacture }
    
      respond_to do |format|
        format.html # Renders manufactures.html.erb
        format.json { render json: @payments_by_manufacture }
      end
    end
    
  
    private
  
    def set_contract
      @contract = Contract.find(params[:contract_id])
    end

    def set_payment
        @payment = Payment.all.find(params[:id])
    end
  
    def payment_params
      params.require(:payment).permit(:name, :product_name, :payment_date, :status_id, :contract_id, :quantity, :price, :paid,
      transactions_attributes: [:id, :amount, :exchange_rate, :vnd_value, :source]
      )
    end
end
  