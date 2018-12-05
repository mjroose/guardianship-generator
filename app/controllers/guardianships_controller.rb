class GuardianshipsController < ApplicationController
  def index
    @guardianships = Guardianship.all
  end

  def show
    @guardianship = Guardianship.find(params[:id])
    @descripion = @guardianship.description
  end
end
