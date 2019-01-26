defmodule Practice.Calc do
  def parse_float(text) do
    {num, _} = Float.parse(text)
    num
  end

  def tag_tokens(expr) do
      Enum.map(expr, fn(x) ->
      		     if (x == "*" or x == "/" or x == "+" or x == "-") do
		     	{:op, x}
		     else
			val = parse_float(x)
			{:num, val}
		     end
		     end)
  end

  def eval_mult_div([{:num, leftnum}, {:op, op}, {:num, rightnum} | rest]) do
      cond do
      	 op == "*" ->
      	    eval_mult_div([{:num, leftnum * rightnum}] ++ rest)
      	 op == "/" ->
      	    eval_mult_div([{:num, leftnum / rightnum}] ++ rest)
      	 true ->
	    [{:num, leftnum}, {:op, op}] ++ eval_mult_div([{:num, rightnum}] ++ rest)
      end   	  
  end

  def eval_mult_div([car | cdr]) do
      [car] ++ eval_mult_div(cdr)
  end

  def eval_mult_div([]) do
      []
  end

  
  def eval_add_sub([{:num, leftnum}, {:op, op}, {:num, rightnum} | rest]) do
      cond do
      	 op == "+" ->
      	    eval_mult_div([{:num, leftnum + rightnum}] ++ rest)
      	 op == "-" ->
      	    eval_mult_div([{:num, leftnum - rightnum}] ++ rest)
      	 true ->
	    [{:num, leftnum}, {:op, op}] ++ eval_add_sub([{:num, rightnum}] ++ rest)
      end   	  
  end

  def eval_add_sub([car | cdr]) do
      [car] ++ eval_mult_div(cdr)
  end

  def eval_add_sub([]) do
      []
  end

  def trunc_pattern([{:num, x}]) do
      trunc(x)
  end
       	  
  def calc(expr) do
    # This should handle +,-,*,/ with order of operations,
    # but doesn't need to handle parens.
    expr
    |> String.split(~r/\s+/) # tokenize
    |> tag_tokens	     # parse
    |> eval_mult_div	     # MD of PEMDAS
    |> eval_add_sub	     # AS of PEMDAS
    |> trunc_pattern 		     # convert to int

  end
end
