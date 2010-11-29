//newMessage := Message fromString(call message arguments join)

Builder := Object clone

Builder tabs := ""
Builder xml := list()

Builder forward := method(
  addXML("#{self tabs}<" interpolate .. call message name .. ">\n")
  self _indent
  call message arguments foreach(arg,
	  content := self doMessage(arg)
	  if(content type == "Sequence", 
	    addXML("#{self tabs}#{content}\n" interpolate)
	  )
	)
	self _undent
	addXML("#{self tabs}</" interpolate .. call message name .. ">\n")
)

Builder addXML := method(xmlString,
  self xml append(xmlString)
)

Builder _indent := method(
  self tabs := "\t" .. self tabs
)

Builder _undent := method(
  self tabs := self tabs asMutable removeLast
)

Builder reset := method(
  self tabs := ""
  self xml := list()
)

Builder getXml := method(
  xml join
)

//problem 2
squareBrackets := method(
  //call message evaluatedArgs //why doesn't this work?
  call message argsEvaluatedIn(self) 
)
