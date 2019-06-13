defmodule MyappWebQueue.Broker do
  use Conduit.Broker, otp_app: :myapp_web

  configure do
    queue System.get_env("AWS_SQS_NAME_QUEUE")
    # queue "myapp_web-queue-error"
  end

  # pipeline :in_tracking do
  #   plug Conduit.Plug.CorrelationId
  #   plug Conduit.Plug.LogIncoming
  # end

  # pipeline :error_handling do
  #   plug Conduit.Plug.DeadLetter, broker: MyappWebQueue.Broker, publish_to: :error
  #   plug Conduit.Plug.Retry, attempts: 5
  # end

  # pipeline :deserialize do
  #   plug Conduit.Plug.Decode, content_encoding: "gzip"
  #   plug Conduit.Plug.Parse, content_type: "application/json"
  # end

  incoming MyappWebQueue do
    # subscribe :my_subscription, MySubscriber, from: "myapp_web-queue"
  end

  # pipeline :out_tracking do
  #   plug Conduit.Plug.CorrelationId
  #   plug Conduit.Plug.CreatedBy, app: "myapp_web"
  #   plug Conduit.Plug.CreatedAt
  #   plug Conduit.Plug.LogOutgoing
  # end

  # pipeline :serialize do
  #   plug Conduit.Plug.Format, content_type: "application/json"
  #   plug Conduit.Plug.Encode, content_encoding: "gzip"
  # end

  # pipeline :error_destination do
  #   plug :put_destination, &(&1.source <> "-error")
  # end

  outgoing do
    publish :message, to: System.get_env("AWS_SQS_NAME_QUEUE"), other: "options"
    # pipe_through [:out_tracking, :serialize]
    # publish :my_event, to: "myapp_web-my-event"
  end

  # outgoing do
  #   pipe_through [:error_destination, :out_tracking, :serialize]

  #   publish :error
  # end

end
