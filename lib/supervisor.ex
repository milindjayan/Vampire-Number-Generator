defmodule Supervisor1 do
  use Supervisor

  def start_link(first,last) do
    Supervisor.start_link(__MODULE__,[first,last])
  end

  def init([first,last]) do
    range=Enum.to_list(first..last)
    n_cores=:erlang.system_info(:logical_processors_available)

    chunk_value=ceil(length(range)/n_cores)

    ranges=Enum.chunk_every(range,chunk_value,chunk_value)

    children = Enum.map(ranges, fn(limit_num) ->
      worker(GenServer1, [limit_num], [id: limit_num, restart: :temporary])
    end)

    supervise(children, strategy: :one_for_one)

  end
end







