require 'csv'
namespace :import do
    task data: :environment do
        csv_station = CSV.parse(File.read("db/station-data.csv"), :headers => true)
        csv_bike = CSV.parse(File.read("db/bike-data.csv"), :headers => true,)
        csv_station.each do |row|
            s = Station.new
            s.identifier = row[0]
            s.name = row[1]
            s.address = row[6]
            s.save
            puts "station #{s.name} #{s.identifier} added"
        end
        csv_bike.each do |row|
            b = Bike.new
            b.identifier = row[0]
            b.current_station_id = row[1]
            b.save
            puts "bike #{b.identifier} added"

        end

    end
end
