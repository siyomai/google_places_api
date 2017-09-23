defmodule GooglePlacesApiTest do
  use ExUnit.Case
  doctest GooglePlacesApi

  test "greets the world" do
    assert GooglePlacesApi.hello() == :world
  end

  test "test/1" do
    assert GooglePlacesApi.search("london") == "london"
  end
end
