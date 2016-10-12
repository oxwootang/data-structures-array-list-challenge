require_relative 'array_list'

puts "new list, initial capacity 2"
list = ArrayList.new(2)
Reporter.report
puts ""

puts "add 'a'"
list.add("a")
Reporter.report
puts ""

puts "add 'b'"
list.add("b")
Reporter.report
puts ""

puts "add 'c'"
list.add("c")
Reporter.report
puts ""
