defmodule MyappWebQueue.Broker do
  @moduledoc "Module broken"
  use Conduit.Broker, otp_app: :myapp_web
  configure do
    queue System.get_env("AWS_SQS_NAME_QUEUE")
  end

  pipeline :deserialize do
    # plug Conduit.Plug.Decode, content_encoding: "gzip"
    plug Conduit.Plug.Parse, content_type: "application/json"
  end

  incoming MyappWebQueue do
 #   pipe_through [:in_tracking, :error_handling, :deserialize]
    subscribe :message, GenSubscriber, from: System.get_env("AWS_SQS_NAME_QUEUE")
  end

  outgoing do
  #  pipe_through [:out_tracking, :serialize]
    publish :message, to: System.get_env("AWS_SQS_NAME_QUEUE")
  end
end
