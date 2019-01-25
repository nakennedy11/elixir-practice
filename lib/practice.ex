defmodule Practice do
  @moduledoc """
  Practice keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def double(x) do
    2 * x
  end

  def calc(expr) do
    # This is more complex, delegate to lib/practice/calc.ex
    Practice.Calc.calc(expr)
  end

  def factor(x) do
    # Maybe delegate this too.
    #Honetsly Nat this is just rude I really thought it worked for 20
    Practice.Factor.factor(x)
  end

  # TODO: Add a palindrome? function.
  def palindrome(x) do
      #not that crazy but going to delegate out because it seems like good practice at least
    Practice.Palindrome.palindrome(x)
  end
    
end
