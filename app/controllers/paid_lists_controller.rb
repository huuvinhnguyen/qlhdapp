class PaidListsController < ApplicationController
    before_action :set_contract
  
    def index
      @paid_lists = @contract.paid_lists
    end
  
    def new
      @paid_list = @contract.paid_lists.build
    end
  
    def create
      @paid_list = @contract.paid_lists.build(paid_list_params)
      if @paid_list.save
        redirect_to @contract, notice: "Payment added successfully!"
      else
        render :new
      end
    end
  
    private
  
    def set_contract
      @contract = Contract.find(params[:contract_id])
    end
  
    def paid_list_params
      params.require(:paid_list).permit(:amount, :paid_date)
    end
  end
  
