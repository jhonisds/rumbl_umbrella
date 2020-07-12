defmodule InfoSys.Backend do
  @moduledoc """
    Module Backend
  """
  @callback name() :: String.t()
  @callback compute(query :: String.t(), opts :: Keyword.t()) :: [%InfoSys.Result{}]
end
