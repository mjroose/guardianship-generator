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

  def display_attributes(attributes_obj)
    content_tag :div do
      attributes_obj.attributes.each do |key, value|
        if is_not_an_id?(key)
          concat content_tag :p, "#{generate_label_from(key)}: #{format(value)}"
        end
      end
    end
  end

  def is_not_an_id?(key)
    key != 'id' && !key.include?('_id')
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
