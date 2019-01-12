class Card
  VALUES = ("A".."Z").to_a

  def self.shuffled_pairs(num_pairs)
    # Gets values from constants
    values = VALUES

    # Keep adding to values array if more pairs than avail vals
    while num_pairs > values.length
      values = values + values
    end

    # Take num pair values, multiply by two to create pairs
    values = values.shuffle.take(num_pairs) * 2
    values.shuffle!

    #Create Cards out of the values
    values.map { |val| self.new(val) }
  end

  attr_reader :value

  def initialize(value, revealed = false)
    @value = value
    @revealed = revealed
  end

  def hide
    @revealed = false
  end

  def reveal
    @revealed = true
  end

  def to_s
    revealed? ? value.to_s : " "
  end

  def revealed?
    @revealed
  end

  def ==(object)
    object.is_a?(self.class) && object.value == value
  end
end
