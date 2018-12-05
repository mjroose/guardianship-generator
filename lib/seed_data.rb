module SeedData
  ::Faker::Config.locale = 'en-US'

  def fake_guardianship
    Guardianship.create(
      gu_type: Random.rand(0..2),
      protected_person_type: Random.rand(0..1),
      gu_duration: Random.rand(0..2)
    )
  end

  def fake_protected_person
    generic_person.update(
      party_type: 'Protected Person',
      estimated_value: ::Faker::Boolean.boolean ? ::Faker::Number.number(6).to_i : 0,
      eye_color: generate_eye_color,
      hair_color: generate_hair_color,
      height: generate_height,
      weight: generate_weight,
      identifying_marks: generate_identifying_marks,
      gal_name: ::Faker::Boolean.boolean(0.1) ? ::Faker::Name.name : nil,
      relationship_to_protected_person: nil,
      certified_guardian: false,
      interpreter_required: false,
      language: nil,
      attorney_id: nil
    )
  end

  def fake_petitioner
    generic_person.update(
      party_type: 'Petitioner',
      relationship_to_protected_person: generate_relationship,
      attorney: fake_attorney
    )
  end

  def fake_attorney
    Attorney.create(
      name: ::Faker::Name.name,
      bar_number: ::Faker::Number.number(7)
    )
  end

  def fake_guardian_institution
    GuardianInstitution.create(
      name: ::Faker::Company.name + ::Faker::Company.suffix,
      address: generate_address,
      phone: ::Faker::PhoneNumber.phone_number,
      fax: ::Faker::PhoneNumber.phone_number,
      agent_name: ::Faker::Name.name
    )
  end

  def fake_interested_party
    generic_person.update(
      party_type: 'Interested Party',
      relationship_to_protected_person: generate_relationship
    )
  end

  private
    def generic_person
      Party.create(
        first_name: ::Faker::Name.first_name,
        middle_name: ::Faker::Name.first_name,
        last_name: ::Faker::Name.last_name,
        suffix: ::Faker::Boolean.boolean(0.9) ? '' : ::Faker::Name.suffix,
        date_of_birth: ::Faker::Date.backward(365 * 80),
        gender: ::Faker::Boolean.boolean ? 'M' : 'F',
        race: generate_race,
        hispanic: ::Faker::Boolean.boolean(0.2),
        address: generate_address,
        home_phone: ::Faker::PhoneNumber.phone_number,
        work_phone: ::Faker::PhoneNumber.phone_number,
        cell_phone: ::Faker::PhoneNumber.phone_number,
        email: ::Faker::Internet.email
      )
    end
  
    def generate_address
      "#{::Faker::Address.street_address}, #{::Faker::Address.city}, #{::Faker::Address.state_abbr} #{::Faker::Address.zip}"
    end

    def random_index_for(arr)
      Random.rand(0..arr.size)
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
end