doFile("day2.io")

DayTwoProblemOne := UnitTest clone do(
	testICalculateFirstFibonacciNumberCorrectly := method(
		assertEquals(1, Fibonacci iterative(0))
		assertEquals(1, Fibonacci recursive(0))
	)
	testICalculateSecondFibonacciNumberCorrectly := method(
		assertEquals(1, Fibonacci iterative(1))
		assertEquals(1, Fibonacci recursive(1))
	)
	testICalculateTenthFibonacciNumberCorrectly := method(
		assertEquals(55, Fibonacci iterative(9))
		assertEquals(55, Fibonacci recursive(9))
	)
)

DayTwoProblemTwo := UnitTest clone do(
	testNewDivisionMethodReturnsZeroWhenDenominatorIsZero := method(
		assertEquals(0, 10/0)
	)
	testNewDivisionWorksNormallyWhenDenominatorIsNonzero := method(
		assertEquals(2, 10/5)
		assertEquals(10, 10/1)
		assertEquals(-10, 10/(-1))
	)
)

DayTwoProblemThree := UnitTest clone do(
	testSumOfTwoDimensionalArrayIsCorrect := method(
		assertEquals(1, list(list(1)) sum2d)
		assertEquals(3, list(list(1), list(2)) sum2d)
		assertEquals(6, list(list(1), list(2), list(3)) sum2d)
	)
	testSumOfPartiallyTwoDimensionalArrayIsCorrect := method(
		assertEquals(6, list(list(1), 2, 3) sum2d)
	)
	testSumOfOneDimensionalArrayIsCorrectToo := method(
		assertEquals(6, list(1, 2, 3) sum2d)
	)
)

DayTwoProblemFour := UnitTest clone do(
	testAverageOfListOfNumbersIsCorrect := method(
		assertEquals(3, list(3,3,3,3) myAverage)
		assertEquals(3, list(1,2,3,4,5) myAverage)
	)
	testAverageRaisesIoExceptionIfNonNumberInList := method(
		theException := try(list("a", "b", "c") myAverage) 
		
		theException ifNil(
    	fail("It should have raised IoException")
    ) ifNonNil(
  		((theException type) == "IoException") ifFalse(
  			fail("It should have raised IoException")
  		)
    )
	)
)

DayTwoProblemFive := UnitTest clone do(
	testSettingFirstElementOfFirstDimension := method(
		twoDList := TwoDList clone
		twoDList dim(2,2)
		twoDList set(0,0,99)
		assertEquals(99, twoDList get(0,0))
	)
	testSettingOutOfBoundsElementOfTwoDimensionalList := method(
		twoDList := TwoDList clone
		twoDList dim(2,2)
		assertRaisesException(twoDList set(2,0,99))
		assertRaisesException(twoDList set(0,2,99))
	)
	testGettingOutOfBoundsElementOfTwoDimensionalList := method(
		twoDList := TwoDList clone
		twoDList dim(1,1)
		assertNil(twoDList get(1,0))
		assertNil(twoDList get(0,1))
	)
)

DayTwoProblemOne run
DayTwoProblemTwo run
DayTwoProblemThree run
DayTwoProblemFour run
DayTwoProblemFive run