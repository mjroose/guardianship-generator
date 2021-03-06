module PartiesHelper
  def add_party_link_for(guardianship, party_type)
    if party_type == 'Protected Person' && guardianship.try(:protected_person)
      return ''
    else
      party_type_array = party_type.split
      party_type_array[-1] = party_type_array[-1].singularize
      singular_party_type = party_type_array.join(' ')
      link_to("Add", new_guardianship_party_path(guardianship, party_type: singular_party_type), class: 'btn btn-primary btn-sm float-right')
    end
  end

  def party_types
    [ 'Protected Person', 'Petitioners', 'Close Relatives', 'Interested Parties' ]
  end

  def party_type_to_sym(party_type)
    party_type.downcase.gsub(/\s/, '_').to_sym
  end

  def link_list_for(guardianship, method)
    if method == :protected_person && guardianship.try(method)
      concat name_as_li_link_for(guardianship.protected_person)
    else
      parties = guardianship.try(method)
      if parties && parties.size > 0
        parties.each do |party|
          concat name_as_li_link_for(party)
        end
      elsif parties && parties.size == 0
        concat content_tag(:li, ' ', class: 'list-group-item')
      end
    end
    ''
  end

  def parties_heading(heading)
    content_tag :h5, heading
  end

  def name_as_li_link_for(party)
    content_tag(:li, class: 'list-group-item') do
      concat link_to(party.name, guardianship_party_path(@guardianship, party), class: 'text-dark align-middle')
      concat link_to("Delete", guardianship_party_path(@guardianship, party), method: 'delete', class: 'btn btn-light btn-sm float-right')
    end
  end

  def display_attributes(attributes_obj)
    attributes_obj.attributes.each do |key, value|
      if is_not_an_id?(key)
        concat content_tag :li, "#{generate_label_from(key)}: #{format(value)}", class: "list-group-item"
      end
    end
    ''
  end

  def list_heading(heading)
    content_tag :li, class: "strong list-group-item bg-dark text-white" do
      content_tag :strong, heading
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
