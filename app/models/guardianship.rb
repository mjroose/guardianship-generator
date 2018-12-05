class Guardianship < ApplicationRecord
  has_many :parties
  has_many :guardianship_institutions
  
  enum gu_type: [ :individual, :estate, :individual_and_estate ]
  enum protected_person_type: [ :minor, :adult ]
  enum gu_duration: [ :temporary, :permanent, :temporary_and_permanent ]
  
  def protected_person
    self.parties.protected_persons.first
  end

  def caption
    "In re: the Guardianship of #{protected_person.name}"
  end

  def short_caption
    "Guardianship of #{protected_person.name}"
  end
end
