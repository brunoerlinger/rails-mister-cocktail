class DosesController < ApplicationController
  before_action :set_dose, only: [ :new, :create ]
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(doses_params)
    @dose.cocktail = @cocktail
      if @dose.save
        redirect_to cocktail_path(@cocktail)
      else
        render :new
      end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktails_path
  end

  private

  def set_dose
      @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def doses_params
      # *Strong params*: You need to *whitelist* what can be updated by the user
      # Never trust user data!
      params.require(:dose).permit(:description, :ingredient_id)
  end
end
