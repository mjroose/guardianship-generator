class BasicPartyInfo < ApplicationRecord
  belongs_to :party, optional: true
  belongs_to :attorney, optional: true
end