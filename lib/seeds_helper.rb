# frozen_string_literal: true

require 'open-uri'
module SeedsHelper
  class << self
    def create_developer!(attributes = {})
      first_name = generate_name(3, 30)
      last_name = generate_name(3, 30)
      email = "#{first_name.downcase}.#{last_name.downcase}@remotetalentsource.com"
      user = create_user!(email)
      location = locations.values.sample
      open_roles = PrimaryRole.order('RANDOM()').limit(2)
      skills = Skill.where(category_id: open_roles.pluck(:category_id))
      attributes = {
        user:,
        first_name:,
        last_name:,
        primary_role_id: PrimaryRole.all.map(&:id).sample,
        experience: 5,
        heading: Faker::Lorem.sentence,
        search_status: Employee.search_statuses.keys.sample,
        role_type_ids: [RoleType.all.sample.id],
        role_level_ids: [RoleLevel.all.sample.id],
        primary_role_ids: open_roles.ids,
        skill_ids: skills.pluck(:id),
        location_attributes: {
          city: location.city,
          state: location.state,
          country: location.country,
          address: location.address,
          latitude: location.latitude,
          longitude: location.longitude
        },

        social_link_attributes: social_links
      }
      bio_content = Faker::Lorem.paragraph(sentence_count: 50)
      # bio = ActionText::Content.new(body: bio_content)
      Employee.find_or_create_by!(user:) do |developer|
        developer.assign_attributes(attributes)
        developer.bio = bio_content
        attach_developer_avatar(developer)
        developer.save
      end
    end

    def create_company!(attributes = {})
      first_name = generate_name(3, 30)
      last_name = generate_name(3, 30)
      email = "#{first_name.downcase}.#{last_name.downcase}@remotetalentsource.com"
      user = create_user!(email, role: 2)

      name = Faker::Name.name
      company_email = Faker::Internet.email(name:, separators: ['+'])
      tagline = Faker::Lorem.sentence
      founded = Faker::Date.between(from: '2014-09-23', to: '2014-09-25').year.to_s
      location = locations.values.sample
      phone = Faker::PhoneNumber.cell_phone_in_e164
      website = Faker::Internet.domain_name
      size =  Company::COMPANY_SIZE[Company::COMPANY_SIZE.keys.sample]
      industry = Industry.all.sample
      specialities = Speciality.order('RANDOM()').limit(2)
      bio_content = Faker::Lorem.paragraph(sentence_count: 50)
      attributes = {
        user:,
        name:,
        tagline:,
        company_email:,
        phone:,
        website:,
        size:,
        founded:,
        location_attributes: {
          city: location.city,
          state: location.state,
          country: location.country,
          address: location.address,
          latitude: location.latitude,
          longitude: location.longitude
        },
        company_industry_attributes: {
          industry_id: industry.id
        },
        speciality_ids: specialities.ids
      }

      Company.find_or_create_by!(user:) do |company|
        company.assign_attributes(attributes)
        company.bio = bio_content
        attach_business_avatar(company)
        company.save
      end
    end

    def locations
      location_seeds.map do |name, attrs|
        [name.to_sym, Location.new(attrs)]
      end.to_h
    end

    private

    def create_user!(email, role: 1)
      attributes = {
        email:,
        role:,
        password: 'password',
        password_confirmation: 'password',
        confirmed_at: DateTime.current
      }

      User.find_or_create_by!(email:) do |user|
        user.assign_attributes(attributes)
      end
    end

    def location_seeds
      @location_seeds ||= YAML.load_file(Rails.root.join('db', 'seeds', 'locations.yml'))
    end

    def developer_avatar_urls
      @developer_avatar_urls ||= YAML.load_file(Rails.root.join('db', 'seeds', 'avatars.yml'))
                                     .map { |image_id| unsplash_url_for(image_id) }
    end

    def business_avatar_urls
      @business_avatar_urls ||= YAML.load_file(Rails.root.join('db', 'seeds', 'business_avatars.yml'))
                                    .map { |image_id| unsplash_url_for(image_id) }
    end

    def attach_developer_avatar(record)
      attach_avatar(record, developer_avatar_urls)
    end

    def attach_business_avatar(record)
      attach_avatar(record, business_avatar_urls)
    end

    def attach_avatar(record, avatars)
      uri = URI.parse(avatars[record.class.count])
      file = uri.open
      record.avatar.attach(io: file, filename: 'avatar.png')
    end

    def unsplash_url_for(image_id)
      "https://images.unsplash.com/#{image_id}?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=512"
    end

    def generate_name(min_length, max_length)
      name = ''
      loop do
        name = Faker::Name.send(%i[first_name last_name].sample)
        break if name.length >= min_length && name.length <= max_length
      end
      name
    end

    def social_links
      {
        website: Faker::Internet.url(host: 'example.com'),
        linkedin: "linkedin.com/#{Faker::Internet.username(specifier: 1..20)}",
        github: "github.com/#{Faker::Internet.username(specifier: 1..20)}",
        twitter: Faker::Internet.username(specifier: 1..15),
        gitlab: "gitlab.com/#{Faker::Internet.username(specifier: 1..20)}",
        stackoverflow: "stackoverflow.com/users/#{Faker::Number.number(digits: 5)}"
      }
    end
  end
end
