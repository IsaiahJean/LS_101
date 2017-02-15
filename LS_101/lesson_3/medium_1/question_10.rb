=begin
Question 10

Consider these two simple methods:

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end
What would be the output of this code:

bar(foo)
=end

Answer:

value returned from the foo method is always yes ("yes == no")
so the answer is no, false.