class PartiesController < ApplicationController

  def show
    @guardianship = Guardianship.find(params[:guardianship_id])
    @party = Party.find(params[:id])
  end

  def new
    @guardianship = Guardianship.find(params[:guardianship_id])
    @party = Party.new
  end
end
