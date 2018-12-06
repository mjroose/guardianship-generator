def fake_guardianship
  Guardianship.create(
    gu_type: Random.rand(0..2),
    protected_person_type: Random.rand(0..1),
    gu_duration: Random.rand(0..2)
  )
end

def fake_protected_person(gu)
  protected_person = Party.create(party_type: 'Protected Person', relationship_to_protected_person: nil)
  generate_basic_party_info(protected_person)
  generate_demographic_info(protected_person)
  generate_contact_info(protected_person)
  generate_protected_person_info(protected_person)
  protected_person
end

def fake_petitioner(gu)
  petitioner = Party.create(party_type: 'Petitioner', relationship_to_protected_person: generate_relationship)
  generate_basic_party_info(petitioner)
  generate_demographic_info(petitioner)
  generate_contact_info(petitioner)
  petitioner
end

def fake_attorney
  Attorney.create(
    name: Faker::Name.name,
    bar_number: Faker::Number.number(7)
  )
end

def fake_guardian_institution(gu)
  GuardianInstitution.create(
    name: Faker::Company.name + Faker::Company.suffix,
    street_address_1: Faker::Address.street_address,
    street_address_2: '',
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: Faker::Address.zip,
    phone: Faker::PhoneNumber.phone_number,
    fax: Faker::PhoneNumber.phone_number,
    agent_name: Faker::Name.name
  )
end

def fake_interested_party(gu)
  interested_party = Party.create(party_type: 'Interested Party', relationship_to_protected_person: generate_relationship)
  generate_basic_party_info(interested_party)
  generate_demographic_info(interested_party)
  generate_contact_info(interested_party)
  interested_party
end

def generate_demographic_info(party)
  DemographicInfo.create(
    party: party,
    date_of_birth: Faker::Date.backward(365 * 80),
    gender: Faker::Gender.binary_type,
    race: generate_race,
    hispanic: Faker::Boolean.boolean(0.2)
  )
end

def generate_basic_party_info(party)
  BasicPartyInfo.create(
    party: party, 
    first_name: Faker::Name.first_name,
    middle_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    suffix: Faker::Boolean.boolean(0.9) ? '' : Faker::Name.suffix
  )
end

def generate_contact_info(party)
  ContactInfo.create(
    party: party,
    street_address_1: Faker::Address.street_address,
    street_address_2: '',
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: Faker::Address.zip,
    home_phone: Faker::PhoneNumber.phone_number,
    work_phone: Faker::PhoneNumber.phone_number,
    cell_phone: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.email
  )
end

def generate_protected_person_info(party)
  ProtectedPersonInfo.create(
    party: party,
    estimated_value: Faker::Boolean.boolean ? Faker::Number.number(6).to_i : 0,
    eye_color: generate_eye_color,
    hair_color: generate_hair_color,
    height: generate_height,
    weight: generate_weight,
    identifying_marks: generate_identifying_marks,
    gal_name: Faker::Boolean.boolean(0.1) ? Faker::Name.name : nil,
    interpreter_required: false,
    language: nil
  )
end

def random_index_for(arr)
  Random.rand(0..(arr.size - 1))
end

def generate_race
  races = ['white', 'black', 'asian', 'latino']
  random_index = random_index_for(races)
  races[random_index]
end

def generate_eye_color
  eye_colors = ['blue', 'blue', 'brown', 'brown', 'green']
  random_index = random_index_for(eye_colors)
  eye_colors[random_index]
end

def generate_hair_color
  hair_colors = ['brown', 'brown', 'blonde', 'blonde', 'black', 'black', 'red']
  random_index = random_index_for(hair_colors)
  hair_colors[random_index]
end

def generate_height
  minimum_height = 45
  maximum_height = 80
  Random.rand(minimum_height..maximum_height)
end

def generate_weight
  minimum_weight = 80
  maximum_weight = 300
  Random.rand(minimum_weight..maximum_weight)
end

def generate_identifying_marks
  identifying_marks = ['', '', 'scars', 'birthmark', 'tattoo', 'scars and tattoo', 'birthmark and tattoos']
  random_index = random_index_for(identifying_marks)
  identifying_marks[random_index]
end

def generate_relationship
  relationships = [
    'Spouse',
    'Parent',
    'Sibling',
    'Son',
    'Daughter',
    'Grandchild',
    'Care Taker'
  ]
  random_index = random_index_for(relationships)
  relationships[random_index]
end

10.times do
  guardianship = fake_guardianship

  guardianship.parties << fake_protected_person(guardianship)

  Random.rand(1..2).times do
    guardianship.parties << fake_petitioner(guardianship)
  end
  
  Random.rand(1..3).times do
    guardianship.parties << fake_interested_party(guardianship)
  end
end