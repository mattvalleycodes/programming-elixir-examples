defmodule Subscriber do
  defstruct name:     "",
    paid:     false,
    over_18:  true
end


#s1 = %Subscriber{}
#IO.inspect s1
#
#s2 = %Subscriber{name: "Dave"}
#IO.inspect s2
#
#s3 = %Subscriber{name: "Mary", paid: true}
#IO.inspect s3
#
#IO.puts s3.name
#
#%Subscriber{name: a_name} = s3
#IO.puts a_name
#
#s4 = %Subscriber{s3 | paid: false}
#IO.inspect s4
