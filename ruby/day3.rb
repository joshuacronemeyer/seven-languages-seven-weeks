# Day 3 Self Study 
# Do: 
# Modify the CSV application to support an each method to return a 
# CsvRow object. Use method_missing on that CsvRow to return the value 
# for the column for a given heading. For example, for the ﬁle: 
# one, two 
# lions, tigers 
# allow an API that works like this: 
# csv = RubyCsv.new 
# csv.each {|row| puts row.one} 
# should return "lions". 
# 
class CsvRow
  def initialize(headers, content)
    @content = {}
    headers.each_with_index do |header, i|
      @content[header] = content[i]
    end
  end

  def method_missing(name, *args)
    @content[name.to_s]
  end
end

module ActsAsCsv 

  def self.included(base) 
    base.extend ClassMethods 
  end 

  module ClassMethods 

    def acts_as_csv 
      include InstanceMethods 
    end 

  end 

  module InstanceMethods 

    def read 
      filename = self.class.to_s.downcase + '.txt'
      return self unless File.exist?(filename)#added this line so i don't have to really have a file.
      @csv_contents = [] 
      file = File.new(filename) 
      @headers = file.gets.chomp.split(', ') 
      file.each do |row| 
        @csv_contents << CsvRow.new(@headers, row.chomp.split(', ')) 
      end 
    end 

    attr_accessor :headers, :csv_contents 

    def initialize 
      read 
    end 

    def each
      for element in @csv_contents
        yield(element)
      end
    end 

  end 
end 

class RubyCsv # no inheritance! You can mix it in 
  include ActsAsCsv
  acts_as_csv 
end 

csv = RubyCsv.new

#since i don't have a file I am just setting the state of the RubyCsv object
headers = ['one', 'two']
row = CsvRow.new(headers, ['lions', 'tigers'])
csv.headers = headers
csv.csv_contents = [row]

#test it.
result = ""
csv.each {|row| result = row.one}
puts "it works!" if result == "lions"
