defmodule MyAppTest do
  use ExUnit.Case
  doctest MyApp
  import Mock

  test "greets the world" do
    assert MyApp.hello() == :world
  end

  test_with_mock "test_name", HTTPotion,
    [get: fn(_url) -> "<html></html>" end] do
    HTTPotion.get("http://example.com")
    assert_called HTTPotion.get("http://example.com")
  end
end
