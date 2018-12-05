class GuardianshipsController < ApplicationController
  def index
    @guardianships = Guardianship.all
  end
end
