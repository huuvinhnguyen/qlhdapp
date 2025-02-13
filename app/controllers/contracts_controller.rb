class ContractsController < ApplicationController
    before_action :set_contract, only: %i[show edit update destroy]
  
    def index
      @contracts = Contract.includes(:manufacture).order(created_at: :desc)
    end
  
    def show
        @payments = @contract.payments # Ensure @payments is assigned
    end
  
    def new
      @contract = Contract.new
      @contract.build_manufacture # Tạo manufacture mới cho contract
    end
  
    def create
      @contract = Contract.new(contract_params)
      if @contract.save
        redirect_to contracts_path, notice: 'Hợp đồng đã được tạo thành công.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @contract.update(contract_params)
        redirect_to contracts_path, notice: 'Hợp đồng đã được cập nhật thành công.'
      else
        render :edit
      end
    end
  
    def destroy
      @contract.destroy
      redirect_to contracts_path, notice: 'Hợp đồng đã được xóa thành công.'
    end
  
    private
  
    def set_contract
      @contract = Contract.find(params[:id])
    end
  
    def contract_params
        params.require(:contract).permit(:contract_no, :description, :contract_date, :manufacture_id)
    end
  end
  
