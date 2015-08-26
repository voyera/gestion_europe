# Controller with all static pages
class CooperativesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_cooperative, except: [:new, :index]

  def new
    @cooperative = Cooperative.new
  end

  def create
    if @cooperative.save
      flash[:success] = 'Cooperative was successfully created.'
      redirect_to cooperatives_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @cooperative.update_attributes(cooperative_params)
      flash[:success] = 'Cooperative was successfully updated.'
      redirect_to @cooperative
    else
      render :edit
    end
  end

  def destroy
    if @cooperative.destroy
      flash[:success] = 'Cooperative was successfully deleted.'
      redirect_to cooperatives_path
    end
  end

  def index
    @cooperatives = Cooperative.all
  end

  def show
  end

  private

  def set_cooperative
    if params[:id].present?
      @cooperative = Cooperative.find(params[:id])
    else
      @cooperative = Cooperative.create(cooperative_params)
    end
  end

  def cooperative_params
    params
      .require(:cooperative)
      .permit(:name, :short_name, :organism, :institution, :bank_account)
  end
end
