class Guardianship < ApplicationRecord
  has_many :parties
  has_many :guardianship_institutions
  
  enum gu_type: [ :individual, :estate, :individual_and_estate ]
  enum protected_person_type: [ :minor, :adult ]
  enum gu_duration: [ :temporary, :permanent, :temporary_and_permanent ]
  
  def protected_person
    self.parties.where(party_type: 'Protected Person').first
  end

  def petitioners
    self.parties.where(party_type: 'Petitioner')
  end

  def interested_parties
    self.parties.where(party_type: 'Interested Party')
  end

  def caption
    "In re: the Guardianship of #{protected_person.name}"
  end

  def short_caption
    "Guardianship of #{protected_person.name}"
  end
end
