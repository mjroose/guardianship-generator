class Guardianship < ApplicationRecord
  has_many :parties
  has_many :guardianship_institutions
  
  enum gu_type: [ "Individual", "Estate", "Individual and Estate" ]
  enum protected_person_type: [ "Minor", "Incapacitated Adult" ]
  enum gu_duration: [ "Temporary", "Permanent", "Temporary and Permanent" ]
  
  def description
    "#{gu_duration} Guardianship Over the #{gu_type} of #{protected_person_type.with_indefinite_article}"
  end

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
