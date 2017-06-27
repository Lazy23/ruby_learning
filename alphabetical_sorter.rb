class AlphabeticalSorter
  def initialize(input_data)
    @input_data = input_data
  end

  def process
    @input_data.sort
  end
end

class AlphabeticalSorterTest
  def initialize(input_data, expected_data)
    @input_data = input_data
    @expected_data = expected_data
  end

  def test
    actual_data = AlphabeticalSorter.new(@input_data).process
    fail "Wrong result, actual data is #{actual_data} but expected data is #{@expected_data}" if actual_data != @expected_data
  end
end

input_data = ['Abby', 'Cartman', 'Bob']
expected_data = ['Abby', 'Bob', 'Cartman']

AlphabeticalSorterTest.new(input_data, expected_data).test
