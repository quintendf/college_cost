namespace :csv do



  desc "Import CSV Data"
  task :import => :environment do

    require 'csv'

    csv_file_path = '/Users/qf/Downloads/price_data.csv'

    CSV.foreach(csv_file_path, headers: true) do |row|
      row = Price.create!({
        :college => row[0],
        :price => row[1],
      })
    end
  end
end