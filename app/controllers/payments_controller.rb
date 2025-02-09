class PaymentsController < ApplicationController
    before_action :set_payment, only: %i[show edit update destroy]
  
    def index
      @payments = Payment.all.order(created_at: :desc)
    end
  
    def show
    end
  
    def new
      @payment = Payment.new
    end
  
    def create
      @payment = Payment.new(payment_params)
      if @payment.save
        redirect_to payments_path, notice: 'Payment was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @payment.update(payment_params)
        redirect_to payments_path, notice: 'Payment was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @payment.destroy
      redirect_to payments_path, notice: 'Payment was successfully deleted.'
    end
  
    private
  
    def set_payment
      @payment = Payment.find(params[:id])
    end
  
    def payment_params
      params.require(:payment).permit(:name, :description, :amount, :payment_date)
    end
  end
  
