namespace :csv do



  desc "Import CSV Data"
  task :import_price => :environment do

    require 'csv'

    csv_file_path = '/Users/qf/Downloads/price_data.csv'

    CSV.foreach(csv_file_path, headers: true) do |row|
      row = Price.create!({
        :college => row[0],
        :price => row[1],
      })
    end
  end

  task :import_salary => :environment do

    require 'csv'

    csv_file_path = '/Users/qf/Downloads/salary_data.csv'

    CSV.foreach(csv_file_path, headers: true) do |row|
      row = Salary.create!({
        :major => row[0],
        :starting_salary => row[1],
        :mid_career_salary => row[2],
      })
    end
  end
end