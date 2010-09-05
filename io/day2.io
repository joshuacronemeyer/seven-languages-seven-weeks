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
Number / := method(denominator, if(denominator == 0, 0, denominator real_division))
(0/0) println

