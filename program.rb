require "csv"
require_relative "null_record"
require_relative "database"
require_relative "record"
body = File.open("hotels.csv", "r")

csv = CSV.new(body, headers: true, header_converters: :symbol)

database = Database.new(csv)
table = database.store

table.each do |entry|
  entry[:rooms] = entry[:number_of_singles].to_i + entry[:number_of_doubles].to_i
end

input = ""
while input != "q"
  print "What Property? > "
  input = gets.chomp

  find_input = table.detect { |entry| entry[:hotel] == input }

  record = Record.new(find_input) || NullRecord.new

  puts
  puts record.stringify
  puts
end
