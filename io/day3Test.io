doFile("day3.io")

DayThreeProblemOne := UnitTest clone do(  
  testIndentationWorks := method(
    Builder div(div("foo"))
    assertEquals("<div>\n\t<div>\n\t\tfoo\n\t</div>\n</div>\n", Builder getXml)
  )
)

DayThreeProblemOne run