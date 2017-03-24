require 'benchmark'

def merge(b, c)
  a = []
  b.first < c.first ? a << b.shift : a << c.shift while b.size > 0 && c.size > 0
  b.size == 0 ? a = a + c : a = a + b
end

def merge_sort(ary)
  return ary if ary.size == 1
  ary = merge(merge_sort(ary.slice(0, ary.size / 2)), merge_sort(ary.slice((ary.size / 2)..-1)))
end

b = Benchmark.measure do
  10000.times do
    unsorted_ary = []
    10.times do
      unsorted_ary << rand(100)
    end
    sorted_by_sort = unsorted_ary.sort
    print "#{unsorted_ary} should be sorted as #{sorted_by_sort},"
    sorted_by_sortmerge = merge_sort(unsorted_ary)
    puts " actual:  #{sorted_by_sortmerge}"
    unless sorted_by_sort == sorted_by_sortmerge
      raise StandardError, "you fucked up"
    else
      puts "It's ok"
    end
    puts sorted_by_sort == sorted_by_sortmerge
    p unsorted_ary
  end
end
puts b
