class CocktailsController < ApplicationController
  before_action :find_cocktail, only: %i[show]
  def index
    @cocktails = Cocktail.all
  end

  def show

  end
  def new
    @cocktail = Cocktail.new
    # @dose = Dose.new
  end
  def create
    @cocktail = Cocktail.new(cocktail_params)
    # @ingredient = Ingredient.find(params[:ingredient_id])
    # @review.dose = @dose
    # @dose = Dose.find(params[:dose_id])
    # @review.ingredient = @ingredient

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end

