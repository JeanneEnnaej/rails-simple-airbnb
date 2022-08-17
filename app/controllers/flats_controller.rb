class FlatsController < ApplicationController
before_action :set_flat, only: [:show, :edit, :update, :destroy ]

  def index
    @flats = Flat.all
  end

  def new
    @flat = Flat.new
  end

  def show
  end

  def create
    @flat = Flat.create(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new, status: :unprocessable_entity
    end
  end

   def edit
   end

   def update
    @flat.update(flat_params)
  end

  def destroy
    @flat.destroy
    redirect_to flats_path, status: :see_other
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
