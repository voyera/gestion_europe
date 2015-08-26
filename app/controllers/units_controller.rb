# Controller with all static pages
class UnitsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_unit, except: [:new]

  def new
    @cooperative = Cooperative.find(params[:cooperative_id])
    @unit = @cooperative.units.build
  end

  def create
    if @unit.save
      flash[:success] = 'Unit was successfully created.'
      redirect_to @unit.cooperative
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @unit.update_attributes(unit_params)
      flash[:success] = 'Unit was successfully updated.'
      redirect_to @unit.cooperative
    else
      render :edit
    end
  end

  def destroy
    if @unit.destroy
      flash[:success] = 'Unit was successfully deleted.'
      redirect_to units_path
    end
  end

  def show
  end

  private

  def set_unit
    if params[:id].present?
      @unit = Unit.find(params[:id])
      @cooperative = @unit.cooperative
    else
      @cooperative = Cooperative.find(params[:cooperative_id])
      @unit = @cooperative.units.new(unit_params)
    end
  end

  def unit_params
    params
      .require(:unit)
      .permit(:name, :owner, :account, :amount, :cooperative)
  end
end
