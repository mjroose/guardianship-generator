class GuardianshipsController < ApplicationController
  def index
    @guardianships = Guardianship.all
  end

  def show
    @guardianship = Guardianship.find(params[:id])
  end
end
