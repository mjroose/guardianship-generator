class Party < ApplicationRecord
  belongs_to :guardianship
  belongs_to :attorney, optional: true
  has_one :basic_party_info
  has_one :contact_info
  has_one :demographic_info
  has_one :protected_person_info

  accepts_nested_attributes_for :basic_party_info, :contact_info, :demographic_info, :protected_person_info

  def name
    name = [first_name, middle_initial, last_name, suffix].join(' ')
    name.split.join(' ')
  end

  def middle_initial
    middle_name != '' ? "#{middle_name.first}." : ''
  end
end
