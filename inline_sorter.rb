class InlineSorter
  def initialize(input_chain)
    @input_chain = input_chain
  end

  def process
    glass_chain = @input_chain

    first_word = glass_chain.shift # get 'Bob'
    chainable_word = glass_chain.find { |word| word.downcase.start_with?(first_word.last) } # get 'Bruce'
    second_chainable_word = glass_chain.find { |word| word.downcase.start_with?(chainable_word.last) } # get 'Eva'
    third_chainable_word = glass_chain.find { |word| word.downcase.start_with?(second_chainable_word.last) } # get 'Apollon'



    @input_chain.map do |word|

    end
  end

  def chains(words, base_word = nil)
    # base_word ||= words.shift

    # chainable_word = words.find { |word| word.downcase.start_with?(base_word.last) }

    words.map do |word|
      next chains(words - [word], word) unless base_word

      chainable_word = words.find { |word| word.downcase.start_with?(base_word.last) }

      next unless chainable_word

      chainable_word + [chains(words - [chainable_word], chainable_word)]
    end
  end
end

class InlineSorterTest
  def initialize(input_chain, correct_chain)
    @input_chain = input_chain
    @correct_chain = correct_chain
  end

  def test
    actual_data = InlineSorter.new(@input_chain).process
    fail "Wrong result" if actual_data != @correct_chain
  end
end

input_chain = ['Bob', 'Eva', 'Klark', 'Bruce', 'Apollon']
correct_chain = ['Bob', 'Bruce', 'Eva', 'Apollon']
correct_chain = ['Eva', 'Apollon']
correct_chain = ['Klark']
correct_chain = ['Bruce', 'Eva', 'Apollon']
correct_chain = ['Apollon']
InlineSorterTest.new(input_chain, correct_chain).test

'A'.downcase == 'a'
'Bob'.first == 'Bob'[0] #=> 'B'
'Bob'.last == 'Bob'[-1] #=> 'b'
'Bob'.start_with?('B') #-> true
'Bob'.end_with?('b') #=> true
