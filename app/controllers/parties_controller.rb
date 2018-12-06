class PartiesController < ApplicationController

  def show
    @guardianship = Guardianship.find(params[:guardianship_id])
    @party = Party.find(params[:id])
  end

  def new
    @guardianship = Guardianship.find(params[:guardianship_id])
    @party = @guardianship.parties.new
    @party.set_party_type_from_params(params[:party_type])
  end

  def create
    raise params.inspect
  end

end
