class Party < ApplicationRecord
  belongs_to :guardianship
  has_one :basic_party_info, :dependent => :destroy
  has_one :contact_info, :dependent => :destroy
  has_one :demographic_info, :dependent => :destroy
  has_one :protected_person_info, :dependent => :destroy

  accepts_nested_attributes_for :basic_party_info, :demographic_info, :contact_info, :protected_person_info

  def name
    name = [
      basic_party_info.first_name,
      middle_initial,
      basic_party_info.last_name, 
    ].join(' ')
    name_without_suffix = name.split.join(' ')
    basic_party_info.suffix != '' ? name_without_suffix + ", #{basic_party_info.suffix}" : name_without_suffix
  end

  def middle_initial
    basic_party_info.middle_name != '' ? "#{basic_party_info.middle_name.first}." : ''
  end

  def set_party_type_from_params(party_type_string)
    valid_party_types = ['Protected Person', 'Petitioner', 'Guardian', 'Close Relative', 'Interested Party']

    if valid_party_types.include?(party_type_string)
      self[:party_type] = party_type_string
    end
  end
end
