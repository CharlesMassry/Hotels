require "csv"

body = File.open("hotels.csv", "r")

csv = CSV.new(body, headers: true, header_converters: :symbol)

database = csv.to_a.map { |row| row.to_hash }
database.each do |entry|
  entry.each do |key, value|
    value.strip!
  end
end

database.each do |entry|
  entry[:number_of_singles].gsub!(/\D/, "")
  entry[:number_of_doubles].gsub!(/\D/, "")
  entry[:rooms] = entry[:number_of_singles].to_i + entry[:number_of_doubles].to_i
end

puts database
input = ""
while input != "q"
  print "What Property? > "
  input = gets.chomp

  record = database.detect { |entry| entry[:hotel] == input } || NullProperty.new

  puts record
end

class NullProperty
  def no_record
    "No Record Found"
  end
end
