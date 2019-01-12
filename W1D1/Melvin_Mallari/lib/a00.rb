# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.

def caesar_cipher(str, shift)
  res = [] 
  str.split(" ").each do |word|
    res << encode_word(word, shift)
  end
  res.join(' ')
end

def encode_word(word, shift)
  res = ""
  alpha = ('a'..'z').to_a
  word.chars.each do |l|
    curr_index = alpha.find_index(l)
    new_index = (curr_index + shift) % 26
    res << alpha[new_index]
  end
  res
end

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

# Example:
# digital_root(4322) => digital_root(11) => (2)

def digital_root(num)
  return num if num < 10
  res = 0
  while num > 0
    res += num % 10
    num /= 10
  end 
  digital_root(res)
end

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
  alphabet ||= ('a'..'z').to_a
  sorted = ""
  alphabet.each do |c1|
    str.chars.each do |c2|
      sorted << c2 if c2 == c1
    end
  end
  sorted
end

class Array
  # Write a method, `Array#two_sum`, that finds all pairs of positions where the
  # elements at those positions sum to zero.

  # NB: ordering matters. I want each of the pairs to be sorted smaller index
  # before bigger index. I want the array of pairs to be sorted
  # "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def two_sum
    res = []
    complements = {}
    self.each_with_index do |n, index|
      complements[n] ? res << [complements[n], index] : complements[0-n] = index
    end
    res
  end
end

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.
  def real_words_in_string(dictionary)
    res = []
    (0...self.length).each do |i|
      (i...self.length).each do |j|
        res << self[i..j] if (dictionary.include?(self[i..j]) && !res.include?(self[i..j]))
      end
    end
    res
  end
end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  (1..num).select { |n| num%n == 0}
end

def merge(l, r)
  res = []
  until l.empty? || r.empty?
    res << (l.first? > r.first ? r.shift : l.right)
  end
  res + l + r
end