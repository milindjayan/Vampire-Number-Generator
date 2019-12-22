defmodule GenServer1 do
   use GenServer

  def start_link(num_range) do
    {:ok,pid}=GenServer.start_link(__MODULE__,num_range)
    find_vm(pid,num_range)
    {:ok,pid}
  end

  def init (num_range) do
    {:ok,num_range}
  end

  def find_vm(pid,num_range) do
    GenServer.cast(pid, {:find_vm,num_range})
  end

  def get_results(pid) do
    GenServer.call(pid, :get_state)
  end

  def handle_cast({:find_vm,num_range},_numrange) do
    result=Vampire.run_vampire_factors(num_range)
    {:noreply,result}
  end

  def handle_call(:get_state, _from, state) do
    {:reply, state, state}
  end
end


defmodule Vampire do

  def vampire_factors(n) do
    if rem(char_len(n), 2) == 1 do
      []
    else
      half = div(char_len(n), 2)
      sorted = Enum.sort(String.codepoints("#{n}"))
      range_start = trunc(n / :math.pow(10, div(char_len(n), 2)))
      range_end = :math.sqrt(n) |> round
      result = for i<- range_start..range_end , rem(n,i)==0 &&
          char_len(i) == half && char_len(div(n,i)) == half &&
          Enum.sort(String.codepoints("#{i}#{div(n,i)}")) == sorted do
            "#{i} #{div(n,i)}"
          end
      if length(result) > 0  do
        _result1 = ["#{n}"]++ result
      end
    end
  end


  defp char_len(n) do
    length(to_charlist(n))
  end

  def run_vampire_factors(i) do

    result2 = Enum.filter(Enum.filter((for n <- i do
    vampire_factors(n)
    end), fn x -> x != [] end), fn y -> y != nil end)

    for n <- result2 do
      Enum.join(n, " ")
    end

  end
end


