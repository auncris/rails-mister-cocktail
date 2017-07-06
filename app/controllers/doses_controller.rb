class DosesController < ApplicationController

  before_action :set_dose, only: [:destroy]

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.create(params_dose)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    set_dose
    @dose.delete

  end

  private

  def params_dose
  params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end

  def set_dose
  @dose = Dose.find(params[:id])
  end

end
