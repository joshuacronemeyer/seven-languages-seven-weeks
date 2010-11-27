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

//Problem 5
TwoDList := Object clone do(
  init := method(
    self listOfLists := list()
  )
  
  dim := method(x, y,
    y repeat(
  	  newList := list()
  		x repeat(newList append(nil))
  		self listOfLists append(newList)
  	)
  )

  get := method(x, y,
    (y >= self listOfLists size) ifTrue(return nil)
    self listOfLists at(y) at(x)
  )
	
  set := method(x, y, value,
  	(y >= self listOfLists size) ifTrue(Exception raise("There are only " .. listOfLists size .. " lists.  Your attempt to set list at index " .. y .. " failed."))
  	self listOfLists at(y) atPut(x, value)
  )
  
  transpose := method(
    transposedLists := self _emptyTransposedList()
    listOfLists foreach(list,
      index := 0
      list foreach(element,
        transposedLists at(index) append(element)
        index := index + 1
      )
    )
    self _newTwoDList(transposedLists)
  )
  
  _emptyTransposedList := method(
    transposedLists := list()
    listOfLists at(0) size repeat(transposedLists append(list()))
    transposedLists
  )
  
  _newTwoDList := method(listOfLists,
    transpose := TwoDList clone
    transpose listOfLists := listOfLists
    transpose
  )
  
  _ifOutOfBounds := method(index, consequence,
    (index >= self listOfLists size) ifTrue(consequence call)
  )
)