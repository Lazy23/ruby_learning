require 'benchmark'

ticket_number = 426264 # LUCKY!!!

def old_school(ticket_number)
  east_coast =
    ticket_number / 100000 +
    ticket_number / 10000 % 10 +
    ticket_number / 1000 % 10

  west_coast =
    ticket_number / 100 % 10 +
    ticket_number / 10 % 10  +
    ticket_number % 10

  west_coast == east_coast
end

def new_school(ticket_number)
  ticket_number.to_s[0..2].chars.map(&:to_i).inject(:+) ==
    ticket_number.to_s[3..6].chars.map(&:to_i).inject(:+)
end

puts 'Old scholl: %.10f' % Benchmark.realtime { 100_000.times { old_school(ticket_number) } }  # => nil
puts 'New scholl: %.10f' % Benchmark.realtime { 100_000.times { new_school(ticket_number) } }  # => nil

# >> Old scholl: 0.0423649997
# >> New scholl: 0.3006070005
