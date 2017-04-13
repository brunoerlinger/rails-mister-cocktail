class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [ :show ]
  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktails_params)
      if @cocktail.save
        redirect_to cocktail_path(@cocktail)
      else
        render :new
      end
  end
end

private

def set_cocktail
    @cocktail = Cocktail.find(params[:id])
end

def cocktails_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:cocktail).permit(:name)
end
