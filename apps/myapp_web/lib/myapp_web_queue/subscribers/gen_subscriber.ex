defmodule MyappWebQueue.GenSubscriber do
  @moduledoc "Modulo de Subscriber"
  use Conduit.Subscriber
  require Logger

  def process(message, _opts) do
    Logger.info("Begin GenSubscriber : process")
    message
    |> inspect()
    |> Code.format_string!()
    |> Logger.info()
    Logger.info("END GenSubscriber : process")
    message
  end
end
