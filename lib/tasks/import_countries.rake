# lib/tasks/import_countries.rake

namespace :import do
  desc "Import countries from SQL file"
  task countries: :environment do
    sql_file = Rails.root.join('lib', 'assets', 'countries.sql')

    unless File.exist?(sql_file)
      puts "ERROR: countries.sql not found at #{sql_file}"
      next
    end

    sql = File.read(sql_file)

  ActiveRecord::Base.connection.execute(sql)

  puts "Countries imported successfully!"
  end
end
