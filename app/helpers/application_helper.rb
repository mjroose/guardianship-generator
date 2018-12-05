module ApplicationHelper
  def name_list_for(parties)
    parties.collect do |party|
      party.name
    end.to_sentence
  end
end
