defmodule InfoSys do
  @moduledoc """
  Documentation for `InfoSys`.
  """
  @backends [InfoSys.Wolfram]

  defmodule Result do
    @moduledoc """
    Module Result
    """
    defstruct score: 0, text: nil, backend: nil
  end

  def compute(query, opts \\ []) do
    opts = Keyword.put(opts, :limit, 10)
    backends = opts[:backends] || @backends

    backends
    |> Enum.map(&async_query(&1, query, opts))
  end

  defp async_query(backend, query, opts) do
    Task.Supervisor.async_nolink(InfoSys.TaskSupervisor, backend, :compute, [query, opts],
      shutdown: :brutal_kill
    )
  end
end
