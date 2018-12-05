class Party < ApplicationRecord
  belongs_to :guardianship
  belongs_to :attorney, optional: true

end
