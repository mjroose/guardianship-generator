class Guardianship < ApplicationRecord
  has_many :parties
  has_many :guardianship_institutions
  
  enum gu_type: [ :individual, :estate, :individual_and_estate ]
  enum protected_person_type: [ :minor, :adult ]
  enum gu_duration: [ :temporary, :permanent, :temporary_and_permanent ]
  
end
