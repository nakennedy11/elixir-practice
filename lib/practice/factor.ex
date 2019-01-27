defmodule Practice.Factor do

  def parse_int(text) do
    {num, _} = Integer.parse(text)
    num
  end

 # def factor(x) do
 #     factor_help(parse_int(x), 2, [])  
 # end

  def factor(x, count, acc) do
      cond do
        count == x ->
	  acc++[count]
	rem(x, count) == 0 -> # divides evenly
	  factor(div(x, count), count, acc++[count])
	rem(x, count) != 0 ->
	  factor(x, count + 1, acc)
      end	 
   end
end
