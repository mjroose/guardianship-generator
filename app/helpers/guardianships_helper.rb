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
end
