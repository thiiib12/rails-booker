class AdhesionsController < ApplicationController
  def create
    @adhesion = Adhesion.new(adhesion_params)
    @adhesion.family = Family.find(params[:family_id])
    if @adhesion.save!
      redirect_to family_path(@adhesion.family)
    else
      render :new
    end
  end

  private

  def adhesion_params
    params.require(:adhesion).permit(:user_id)
  end

end
