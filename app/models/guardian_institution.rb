class GuardianInstitution < ApplicationRecord
  belongs_to :guardianship, optional: true
end
