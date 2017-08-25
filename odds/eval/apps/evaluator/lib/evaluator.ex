defmodule Evaluator do

  def eval(list_of_expressions) do
    { result, _final_binding } = Enum.reduce(
      list_of_expressions,

      { _result = [], _binding = binding() },

      fn(expression, { result, binding }) ->
        { new_result, new_binding } = Code.eval_string(expression, binding)

        { ["value > #{new_result}", "code > #{expression}" | result ], new_binding }
      end
    )

    Enum.reverse(result)
  end

end
