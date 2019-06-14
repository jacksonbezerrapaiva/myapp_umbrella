defmodule MyappWebQueue.GenSubscriberTest do
  use ExUnit.Case
  use Conduit.Test
  import Conduit.Message
  alias Conduit.Message
  alias MyappWebQueue.GenSubscriber

  describe "process/2" do
    test "returns acked message" do
      message =
        %Message{}
        |> put_body("foo")

      assert %Message{status: :ack} = GenSubscriber.run(message)
    end
  end
end
