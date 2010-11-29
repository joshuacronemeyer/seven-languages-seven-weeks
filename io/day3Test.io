doFile("day3.io")

DayThreeProblemOne := UnitTest clone do(  
  testIndentationWorks := method(
    Builder div(div("foo"))
    assertEquals("<div>\n\t<div>\n\t\tfoo\n\t</div>\n</div>\n", Builder getXml)
  )
)

DayThreeProblemTwo := UnitTest clone do(
  testSquareBracketsWork := method(
    assertEquals(list(1,2,3), [1,2,3])
  )
)
DayThreeProblemOne run
DayThreeProblemTwo run
