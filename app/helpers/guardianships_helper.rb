module GuardianshipsHelper
  def gu_types
    [ ["Individual", "Individual"], ["Estate", "Estate"], ["Individual and Estate", "Individual and Estate"] ]
  end

  def protected_person_types
    [ ["Minor", "Minor"], ["Incapacitated Adult", "Incapacitated Adult"] ]
  end

  def gu_durations
    [ ["Temporary", "Temporary"], ["Permanent", "Permanent"], ["Temporary and Permanent", "Temporary and Permanent"] ]
  end

  def guardianship_name_as_li_link_for(guardianship)
    content_tag(:li, class: 'list-group-item') do
      concat link_to(guardianship.short_caption, guardianship_path(guardianship), class: 'text-dark align-middle')
      concat link_to("Delete", guardianship_path(guardianship), method: 'delete', class: 'btn btn-danger btn-sm float-right')
      concat link_to("Edit", edit_guardianship_path(guardianship), class: 'btn btn-light btn-sm float-right')
    end
  end
end
