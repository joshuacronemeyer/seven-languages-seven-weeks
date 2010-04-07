# 1. Find out how to access ﬁles with and without code blocks. What 
# is the beneﬁt of the code block? 
<<ANSWER
The code block means you don't have to explicitly close the file.  Closing the 
block takes care of everything
ANSWER
# 2. How would you translate a hash to an array? Can you translate 
# arrays to hashes?
<<ANSWER
A Hash becomes double nested array.  Array becomes a hash with fixnum index.
ANSWER
# 3. Can you iterate through a hash?
<<ANSWER
Yes
ANSWER
# 4. You can use Ruby arrays as stacks. What other common data 
# structures does array support? 
<<ANSWER
Queue
Linked List
Hash
ANSWER
# Do: 
# 1. Print the contents of an array of sixteen numbers, four numbers 
# at a time, using just each. Now, do the same with each_slice in 
# Enumerable. 
a = (1..16).to_a

group_of_four = []
a.each do |i| 
  group_of_four << i
  if i%4 == 0
    p group_of_four
    group_of_four = []
  end
end

require 'enumerator'
a.each_slice(4) {|a| p a}
#   2. The Tree class was interesting, but it did not allow you to specify 
# a new tree with a clean user interface. Let the initializer accept a 
# nested structure with hashes and arrays. You should be able to 
# specify a tree like this: {’grandpa’ => [ {’dad’ => [’child 1’, ’child 2’]}, 
#   {’uncle’ => [’child 3’, ’child 4’] } ] }. 

class Tree 
  attr_accessor :children, :node_name 
  def initialize(name, children) 
    @children = children 
    @node_name = name 
  end 
  def visit_all(&block) 
    visit &block 
    children.each {|c| c.visit_all &block} 
  end 
  def visit(&block) 
    block.call self 
  end 
end 

class Tree
  def self.new_initialize(nested_structure)
    nested_structure.each do |node|
      name, children = node
      if children.first.class == String
        return Tree.new(name, [Tree.new(children.first, []), Tree.new(children.last, [])])
      else
        return Tree.new(name, [Tree.new_initialize(children.first), Tree.new_initialize(children.last)])
      end
    end
  end
end

test_tree = Tree.new_initialize({"grandpa" => [ {"dad" => ["child 1", "child 2"]}, {"uncle" => ["child 3", "child 4"] } ] })
test_tree.visit_all {|node| puts node.node_name}
#   3. Write a simple grep that will print the lines having any occurrences 
# of a phrase anywhere in a ﬁle. You will need to do a simple regular 
# expression match, and read lines from a ﬁle. (This is surprisingly 
#                                               simple in Ruby.) If you want, include line numbers. 
lines = IO.readlines("day2.rb")
matches = lines.select {|line| line.match(/a phrase/)}
p matches
