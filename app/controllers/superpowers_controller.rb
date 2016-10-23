class SuperpowersController < ApplicationController
  before_action :get_superpower, only: [:show, :edit, :update, :destroy]

  def index
    @superpowers = Superpower.all
  end

  def new 
    @superpower = Superpower.new
  end

  def create
    @superpower = Superpower.new(superpower_params)
    if @superpower.save
      flash[:success] = 'New Superpower Created!'
      redirect_to @superpower
    else
      flash[:error] = @superpower.errors.full_messages.join(' ')
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @superpower.update(superpower_params)
      flash[:success] = 'Superpower Updated'
      redirect_to @superpower
    else
      flash[:error] = @superpower.errors.full_messages.join(' ')
      render :edit
    end
  end

  def destroy
    @superpower.destroy
    redirect_to superpowers_path
  end

  private

  def superpower_params
    params.require(:superpower).permit(:name,:description)
  end

  def get_superpower
    @superpower = Superpower.find_by_id(params[:id])
  end
end