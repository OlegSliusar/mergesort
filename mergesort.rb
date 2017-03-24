require 'benchmark'

def merge(b, c)
  i_b = 0
  i_c = 0
  b_size = b.size
  c_size = c.size
  a = []
  while i_b < b_size && i_c < c_size
    if b.first < c.first
      a << b.shift
      i_b += 1
    else
      a << c.shift
      i_c += 1
    end
  end
  if i_b == b_size
    a = a + c
  else
    a = a + b
  end
  a
end

def merge_sort(ary)
  if ary.size > 1
    ary_b = ary.slice!(0, ary.size / 2)
    ary_c = ary
    ary_b = merge_sort(ary_b)
    ary_c = merge_sort(ary_c)
    ary = merge(ary_b, ary_c)
  end
  ary
end

b = Benchmark.measure do
  100000.times do
    unsorted_ary = []
    10.times { unsorted_ary << rand(100) }
    p "#{unsorted_ary} should be sorted as #{unsorted_ary.sort}, actual:  #{merge_sort(unsorted_ary)}"
    return "DAMI DAVIDO!!!" if unsorted_ary.sort != merge_sort(unsorted_ary)
  end
end
puts b
