require 'byebug'
def my_min_1(arr)
    arr.each_index do |idx|
        return arr[idx] if arr.none?{|el| el < arr[idx]}
    end
end

def my_min_2(arr)
    min = arr[0]
    arr.each do |el|
        if min > el
            min = el
        end
    end
    min
end

def largest_contiguous_subsum1(arr)
    res = -1.0/0
    (0...arr.length).each do |i|
        (i+1...arr.length).each do |j|
            cur_sum = arr[i..j].inject(:+) 
            res = cur_sum if res < cur_sum
        end 
    end 
    res
end

def largest_contiguous_subsum2(arr)
    #debugger
    max_cur_sum = arr[0]
    max_global_sum = arr[0]
    arr[1..-1].each do |el|
        max_cur_sum = [el, max_cur_sum + el].max
        max_global_sum = [max_cur_sum, max_global_sum].max
    end
    max_global_sum
end