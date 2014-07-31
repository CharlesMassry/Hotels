class Database
  def initialize(csv)
    @csv = csv
    @database = []
  end

  def store
    create
  end

  private
  def create
    new
    clean_up
  end

  def new
    @database = @csv.to_a.map { |row| row.to_hash }
  end

  def clean_up
    @database.each do |record|
      remove_whitespace_from(record)
      numify_rooms_in(record)
      remove_non_digits_from_phone_number(record)
    end
  end

  def remove_whitespace_from(record)
    record.each do |key, value|
      value.strip!
    end
  end

  def numify_rooms_in(record)
    record[:number_of_singles].gsub!(/\D/, "")
    record[:number_of_doubles].gsub!(/\D/, "")
  end

  def remove_non_digits_from_phone_number(record)
    record[:phone_number].gsub!(/\D/, "")
  end
end
