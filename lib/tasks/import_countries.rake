# frozen_string_literal: true

# lib/tasks/import_countries.rake
namespace :import do
  # bundle exec rake import:currencies
  desc 'Import currencies from YAML file'
  task currencies: :environment do
    total_imported = 0
    countries_data['country_state_city'].each do |country|
      # Extract currency_name and currency_symbol
      currency_name = country['currency']
      currency_symbol = country['currency_symbol']

      currency = Currency.find_or_initialize_by(name: currency_name) do |currency_object|
        currency_object.symbol = currency_symbol
        if currency_object.save
          puts "Currency Saved #{currency_object.name}"
        else
          puts "Currency #{currency_object.name} have errors #{currency_object.errors.full_messages}"
        end
      end
      # Print currency_name and currency_symbol
      puts "Currency Name: #{currency.name}, Currency Symbol: #{currency.symbol}"
      total_imported += 1
    end

    puts "Total currencies imported: #{total_imported} with your table count #{Currency.count}"
    puts 'Currencies imported successfully!'
  end

  # bundle exec rake import:countries
  desc 'Import countries from YAML file'
  task countries: :environment do
    total_imported = 0
    countries_data['country_state_city'].each do |country|
      # Extract currency_name and currency_symbol
      country_name = country['name']
      country_emoji = country['emoji']
      country_iso2 = country['iso2']
      country_iso3 = country['iso3']
      currency = currency(country['currency'])

      country = Country.find_or_initialize_by(name: country_name) do |country_object|
        country_object.emoji = country_emoji
        country_object.iso2 = country_iso2
        country_object.iso3 = country_iso3
        country_object.currency_id = currency.id

        if country_object.save
          puts "Currency Saved #{country_object.name}"
        else
          puts "Currency #{currency_object.name} have errors #{country_object.errors.full_messages}"
        end
      end
      # Print currency_name and currency_symbol
      puts "Country Name: #{country.name}, Country Symbol: #{country.emoji}"
      total_imported += 1
    end

    puts "Total countries imported: #{total_imported} with your table count #{Country.count}"
    puts 'Countries imported successfully!'
  end

  def countries_data
    sql_file = Rails.root.join('db', 'countries.yml')

    unless File.exist?(sql_file)
      puts "ERROR: countries.yml not found at #{sql_file}"
      exit
    end

    YAML.load_file(sql_file)
  end

  def currency(name)
    Currency.find_by_name(name)
  end
end
