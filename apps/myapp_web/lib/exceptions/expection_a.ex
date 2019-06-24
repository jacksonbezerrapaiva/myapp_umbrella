defmodule ExceptionA do
  defexception message: "Nova exception lançada"

  @impl true
  def exception(value) do
    msg = value
  end
end
