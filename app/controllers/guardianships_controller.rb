class GuardianshipsController < ApplicationController
  def index
    @guardianships = Guardianship.all
  end

  def show
    @guardianship = Guardianship.find(params[:id])
    @descripion = @guardianship.description
  end

  def new
    @guardianship = Guardianship.new
  end

  def create
    @guardianship = Guardianship.create(guardianship_params)
    if @guardianship.persisted?
      redirect_to guardianship_path(@guardianship)
    else
      render :new
    end
  end

  def edit
    @guardianship = Guardianship.find(params[:id])
  end

  def update
    @guardianship = Guardianship.find(params[:id])
    if @guardianship.update(guardianship_params)
      redirect_to guardianship_path(@guardianship)
    else
      render :edit
    end
  end

  def destroy
    @guardianship = Guardianship.find(params[:id])
    @guardianship.destroy
    redirect_to guardianships_path
  end

  private
    def guardianship_params
      params.require(:guardianship).permit(:case_number, :gu_type, :protected_person_type, :gu_duration)
    end
end
