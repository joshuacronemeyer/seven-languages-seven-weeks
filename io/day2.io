//Self study

//Problem 1
Fibonacci := Object clone do( 
	//Iterative fibonacci makes me itchy.
	iterative := method(n, 
		i := 0
		fibSequence := list()
		while(i <= n,
			nextFibNum := if(i <= 1, 1, fibSequence at(i-1) + fibSequence at(i-2))
			fibSequence append(nextFibNum)
			i = i + 1)
		fibSequence at(n)
	)
	//Recursive fibonacci makes me scratchy
	recursive := method(n, if(n <= 1, 1, (self recursive(n-1)) + (self recursive(n-2))))
)

//Problem 2
Number real_division := Number getSlot("/")
Number / := method(denominator, if(denominator == 0, 0, self real_division(denominator)))

//Problem 3
List sum2d := method(
	theSum := 0
	self foreach(element, 
		if(element type == "List", 
			theSum = theSum + element sum2d, 
			theSum = theSum + element
		)
	)
)

//Problem 4
IoException := Exception clone
List myAverage := method(
	sum := 0
	self foreach(element,
		(element type == "Number") ifFalse(IoException raise("Non numeric element."))
		sum = sum + element
	)
	sum / (self size)
)