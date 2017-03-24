# require 'benchmark'

def merge(b, c)
  a = []
  bi = 0
  ci = 0
  while b.size > bi && c.size > ci
    if b[bi] < c[ci]
      a << b[bi]
      bi += 1
    else
      a << c[ci]
      ci += 1
    end
  end
  if bi == b.size
    a = a + c[ci..-1]
  else
    a = a + b[bi..-1]
  end
  a
end

def merge_sort(ary)
  if ary.size > 1
    ary_b = ary.slice(0, ary.size / 2)
    ary_c = ary.slice((ary.size / 2)..-1)
    ary_b = merge_sort(ary_b)
    ary_c = merge_sort(ary_c)
    ary = merge(ary_b, ary_c)
  end
  ary
end

# b = Benchmark.measure do

10.times do
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
# end
# puts b
