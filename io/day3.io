Builder := Object clone

Builder forward := method(
  writeln("#{self indentation}<" interpolate, call message name, ">")
  self indent
  call message arguments foreach(arg,
	  content := self doMessage(arg)
	  if(content type == "Sequence", 
	    writeln("#{self indentation}#{content}" interpolate)
	  )
	)
	self undent
	writeln("#{self indentation}</" interpolate, call message name, ">")
)

Builder indentation := ""

Builder indent := method(
  self indentation := "  " .. self indentation
)

Builder undent := method(
  self indentation := self indentation exSlice(0,-2)
)

Builder  div(
    div(
      ul(
  	    li("Io"), 
  	    li("Lua"), 
  	    li("JavaScript")
	    )
    ),
    div(
      ul(
  	    li("Io"), 
  	    li("Lua"), 
  	    li("JavaScript")
	    )
    )
  )