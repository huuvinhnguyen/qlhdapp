class PaidListsController < ApplicationController
    before_action :set_contract
    before_action :set_paid_list, only: [:destroy]
  
    def index
      @paid_lists = @contract.paid_lists.order(paid_date: :desc)
    end
  
    def new
      @paid_list = @contract.paid_lists.build
    end

    def destroy
      @paid_list.destroy
      redirect_to contract_paid_lists_path(@contract), notice: 'Paid item was successfully deleted.'

    end
  
    def create
      @paid_list = @contract.paid_lists.build(paid_list_params)
      if @paid_list.save
        redirect_to contract_paid_lists_path(@contract), notice: "Payment added successfully!"
      else
        render :new
      end
    end
  
    private

    def set_paid_list
      @paid_list = @contract.paid_lists.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to contract_paid_lists_path(@contract), alert: "Paid item not found."
    end
  
    def set_contract
      @contract = Contract.find(params[:contract_id])
    end
  
    def paid_list_params
      params.require(:paid_list).permit(:amount, :paid_date)
    end
  end
  
