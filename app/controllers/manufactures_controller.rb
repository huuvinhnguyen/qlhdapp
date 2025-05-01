class ManufacturesController < ApplicationController
  before_action :set_manufacture, only: %i[show edit update destroy]

  def index
    @manufactures = Manufacture.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @manufacture = Manufacture.new
  end

  def create
    @manufacture = Manufacture.new(manufacture_params)
    if @manufacture.save
      redirect_to manufactures_path, notice: 'Manufacture was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @manufacture.update(manufacture_params)
      redirect_to manufactures_path, notice: 'Manufacture was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @manufacture.destroy
    redirect_to manufactures_path, notice: 'Manufacture was successfully deleted.'
  end

  private

  def set_manufacture
    @manufacture = Manufacture.find(params[:id])
  end

  def manufacture_params
    params.require(:manufacture).permit(:name, :description, :contract_id)
  end
end
