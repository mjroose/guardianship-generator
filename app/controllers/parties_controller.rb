class PartiesController < ApplicationController
  before_action :authenticate_user!
  
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
    @guardianship = Guardianship.find(params[:guardianship_id])
    @party = @guardianship.parties.create(party_params)
    @attorney = Attorney.new(attorney_params)

    if @party.persisted?
      if @attorney.valid?
        @party.attorney = @attorney
      end

      redirect_to guardianship_party_path(@guardianship, @party)
    else
      render 'parties/new'
    end
  end

  def edit

    @guardianship = Guardianship.find(params[:guardianship_id])
    @party = Party.find(params[:id])
  end

  def update
    @guardianship = Guardianship.find(params[:guardianship_id])
    @party = Party.find(params[:id])
    @attorney = Attorney.new(attorney_params)

    if @party.try(:persisted?)
      if @attorney.valid?
        @party.attorney = @attorney
      end

      @party.update(party_params)

      redirect_to guardianship_party_path(@guardianship, @party)
    else
      render 'parties/new'
    end
  end

  def destroy
    @guardianship = Guardianship.find(params[:guardianship_id])
    @party = Party.find(params[:id])
    @party.destroy
    redirect_to guardianship_path(@guardianship)
  end

  private
    def party_params
      params.require(:party).permit(
        :party_type,
        :relationship_to_protected_person,
        :certified_guardian,
        basic_party_info_attributes: [
          :first_name,
          :middle_name,
          :last_name,
          :suffix,
          :attorney_id
        ],
        contact_info_attributes: [
          :street_address_1,
          :street_address_2,
          :city,
          :state,
          :zip,
          :home_phone,
          :work_phone,
          :cell_phone,
          :email
        ],
        demographic_info_attributes: [
          :date_of_birth,
          :gender,
          :race,
          :hispanic
        ],
        protected_person_info_attributes: [
          :estimated_value,
          :eye_color,
          :hair_color,
          :height,
          :weight,
          :identifying_marks,
          :gal_name,
          :interpreter_required,
          :language
        ]
      )
    end

    def attorney_params
      params.permit(:attorney).permit(:name, :bar_number)
    end
end
