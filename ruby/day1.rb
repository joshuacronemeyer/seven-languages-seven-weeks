# 1. Print the string "Hello, world." 
puts "Hello, world."
# 2. For the string "Hello, Ruby", ﬁnd the index of the word "Ruby". 
puts "Hello, Ruby".index("Ruby")
# 3. Print your name 10 times. 
10.times {puts "Josh"}
# 4. Print the string “This is sentence number 1”, where the number 1 
# changes from 1 to 10. 
(1..10).each {|i| puts "This is sentence number #{i}"}
# 5. Run a Ruby program from a ﬁle.
true 
# 6. Bonus problem: If you’re feeling the need for a little more, write 
# a program that picks a random number. Let a player guess the 
# number, telling the player if the guess is too low or too high. 
# (Hint: rand(10) will generate a random number from 0 to 9, and 
# gets will read a string from the keyboard that you can translate to 
# an integer. ) 
while true do
  my_number = rand(10)
  puts "\n\nI know a nuber from 0 to 9.  Can you guess it?"
  guess = gets
  if my_number == guess.to_i
    puts "you guessed it!"
    break
  elsif my_number > guess.to_i
    puts "too low.  guess again."
  else
    puts "too high. guess again."
  end
end
