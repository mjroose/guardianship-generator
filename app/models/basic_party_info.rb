class BasicPartyInfo < ApplicationRecord
  belongs_to :party, optional: true
  belongs_to :attorney, optional: true

  validates :first_name, presence: true
  validates :last_name, presence: true
end