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
    content_tag :li, link_to(party.name, party_path(party))
  end

  def show_attributes(attribute_keys, attributes)
    
  end
end
