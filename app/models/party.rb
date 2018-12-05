class Party < ApplicationRecord
  belongs_to :guardianship
  belongs_to :attorney, optional: true

  def name
    name = [first_name, middle_initial, last_name, suffix].join(' ')
    name.split.join(' ')
  end

  def middle_initial
    middle_name != '' ? "#{middle_name.first}." : ''
  end

  def self.protected_persons
    self.where(party_type: 'Protected Person')
  end
end
