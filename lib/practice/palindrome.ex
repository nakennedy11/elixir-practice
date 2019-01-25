defmodule Practice.Palindrome do
  def parse_float(text) do
    {num, _} = Float.parse(text)
    num
  end

  def palindrome(x) do
      #check if forward = backwards
      x
      |>String.split(x)
  end
end
