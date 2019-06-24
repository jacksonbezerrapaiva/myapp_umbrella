defmodule MyappWeb.ExceptionATest do
    use ExUnit.Case
    alias ExceptionA

    describe "Test exception " do
      test "returns test message excpetion" do
        assert ExceptionA.exception("test") == "test"
      end
    end
  end
