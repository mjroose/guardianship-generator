module PartiesHelper
  def link_list_for(parties)
    content_tag :ul do
      parties.each do |party|
        concat name_as_li_link_for(party)
      end
    end
  end

  def parties_heading(heading)
    content_tag :h6, heading
  end

  def name_as_li_link_for(party)
    content_tag :li, link_to(party.name, guardianship_party_path(@guardianship, party))
  end

  def contact_information_for(party)
    contact_information_attributes = [
      :first_name,
      :middle_name,
      :last_name,
      :suffix,
      :address,
      :home_phone,
      :work_phone,
      :cell_phone,
      :email
    ]

    display_attributes(party, contact_information_attributes)
  end

  def physical_descriptors_for(party)
    physical_descriptors_attributes = [
      :date_of_birth,
      :gender,
      :race,
      :hispanic
    ]

    display_attributes(party, physical_descriptors_attributes)
  end

  def additional_protected_person_descriptors_for(party)
    additional_descriptors_attributes = [
      :estimated_value,
      :eye_color,
      :hair_color,
      :height,
      :weight,
      :identifying_marks,
      :gal_name
    ]

    display_attributes(party, additional_descriptors_attributes)
  end

  def display_attributes(party, keys)
    content_tag :div do
      keys.each do |key|
        concat content_tag :p, "#{generate_label_from(key)}: #{format(party[key])}"
      end
    end
  end

  def get_values_from(party, keys)
    keys.collect do |key|
      party[key]
    end
  end

  def generate_label_from(key)
    key.to_s.split('_').join(' ').titleize.gsub(/Gal/, 'GAL')
  end

  def format(value)
    if value.class == ActiveSupport::TimeWithZone
      value.strftime('%B %e, %Y')
    else
      value
    end
  end
end
