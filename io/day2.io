//Self study

//Problem 1
"Iterative fibonacci makes me itchy." println
iterative_fib := method(n, 
	i := 0
	fib_sequence := list()
	while(i <= n,
		next_fib_num := if(i <= 1, 1, fib_sequence at(i-1) + fib_sequence at(i-2))
		fib_sequence append(next_fib_num)
		i = i + 1)
	fib_sequence at(n)
)
j := 0
while(j <= 7, iterative_fib(j) println; j = j + 1)

"Recursive fibonacci makes me scratchy." println
recursive_fib := method(n, if(n <= 1, 1, (recursive_fib(n-1)) + (recursive_fib(n-2))))
j := 0
while(j <= 7, recursive_fib(j) println; j = j + 1)

//Problem 2
"Mess up / to return zero when denominator is 0" println
Number real_division := Number getSlot("/")
Number / := method(denominator, if(denominator == 0, 0, self real_division(denominator)))
(0/0) println

//Problem 3
"Add up all the numbers in a 2d array" println
List sum2d := method(
	theSum := 0
	self foreach(element, 
		if(element type == "List", 
			theSum = theSum + element sum2d, 
			theSum = theSum + element
		)
	)
)
list(1,2,3) sum2d println
list(1,2,list(1,2)) sum2d println

//Problem 4
"compute average of a list of numbers" println
IoException := Exception clone
List myAverage := method(
	sum := 0
	self foreach(element,
		(element type == "Number") ifFalse(IoException raise("Non numeric element."))
		sum = sum + element
	)
	sum / (self size)
)
list(1,2,3,4,5) myAverage println
list(1,2,3,4,"hex") myAverage