def sum_to(n)
  return nil if n < 0
  return 0 if n == 0
  n + sum_to(n-1)
end

def add_numbers(nums)
  return nil if nums.empty?
  return nums[0] if nums.length == 1
  nums[0] + add_numbers(nums[1..-1])
end

def gamma_fnc(n)
  factorial(n-1)
end

def factorial(n)
  return nil if n < 0  
  return 1 if n == 0
  n * factorial(n-1)
end

def ice_cream_shop(flavors, favorite)
  return false if flavors.empty?
  return true if flavors[0] == favorite
  ice_cream_shop(flavors[1..-1], favorite)
end

def reverse(string)
  return string if string.length == 1
  reverse(string[1..-1]) + string[0]
end