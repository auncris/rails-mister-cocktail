class DosesController < ApplicationController

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredients = Ingredient.all

  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.create()
    @dose.description = params_dose['description']
    @dose.ingredient = Ingredient.find(params_dose[:ingredient_id])
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.delete
  end

  private

  def params_dose
  params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)

  end


end
