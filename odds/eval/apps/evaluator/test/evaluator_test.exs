defmodule EvaluatorTest do
  use ExUnit.Case
  import LineSigil

  test "evulates a basic expression" do
    lines_of_expressions = ~l"""
    1 + 2
    """

    expected_output = ~l"""
    code > 1 + 2
    value > 3
    """

    output = Evaluator.eval(lines_of_expressions)

    assert output === expected_output
  end


  test "variables are propagates as well" do
    lines_of_expressions = ~l"""
    a = 1
    b = a + 1
    """

    expected_output = ~l"""
    code > a = 1
    value > 1
    code > b = a + 1
    value > 2
    """

    output = Evaluator.eval(lines_of_expressions)

    assert output === expected_output
  end
end
