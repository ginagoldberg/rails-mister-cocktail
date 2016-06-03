class DosesController < ApplicationController
  before_action :set_dose, only: [:edit, :update, :destroy]
  before_action :find_cocktail, only: [:new, :create, :destroy]


  # GET /doses/new
  def new
    @dose = Dose.new
    @dose.cocktail = @cocktail
    @available_ingredients = Ingredient.all - @cocktail.ingredients
    # the line above shows only the ingredients that have not already been used in the cocktail
  end

  # GET /doses/1/edit
  def edit
  end

  # POST /doses
  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail), notice: 'Dose was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /doses/1
  def update
    if @dose.update(dose_params)
      redirect_to @dose, notice: 'Dose was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /doses/1
  def destroy
    @dose.destroy
    redirect_to cocktail_path(@cocktail), notice: 'Dose was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dose
      @dose = Dose.find(params[:id])
    end

    def find_cocktail
      @cocktail = Cocktail.find(params[:cocktail_id])
    end

    # Only allow a trusted parameter "white list" through.
    def dose_params
      params.require(:dose).permit(:description, :ingredient_id)
    end


  end
