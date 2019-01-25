defmodule Practice.Palindrome do
  def parse_float(text) do
    {num, _} = Float.parse(text)
    num
  end

  def palindrome(x) do
      #check if forward = backwards
      x == rev_words(x)
  end

  def rev_words(x) do
      x
      |> String.split()
      |> Enum.map(&rev_chars/1)
      |> Enum.join(" ")
  end
     
  def rev_chars(x) do
      x
      |> String.to_charlist
      |> Enum.reverse
      |> to_string
  end
end
