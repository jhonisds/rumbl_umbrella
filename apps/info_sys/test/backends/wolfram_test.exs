defmodule InfoSys.Backends.WolframTest do
  use ExUnit.Case, async: true

  @tag :pending
  test "makes request, reports results, the terminates" do
    actual = hd(InfoSys.compute("1 + 1", []))
    assert actual.text == "2"
  end

  test "no query results reports an empty list" do
    assert InfoSys.compute("none", [])
  end
end
