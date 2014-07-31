class Record
  attr_reader :record

  def initialize(record)
    @record = record
  end

  def stringify
    <<-EOF
    Phone number #{@record[:phone_number]}
    Location #{@record[:city]}
    Number of Rooms #{@record[:rooms]}
    EOF
  end
end
