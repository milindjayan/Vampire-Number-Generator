defmodule VampireLast do
  use Application

  def start(_type, _args) do
    arguments=System.argv()
    {first,""}=Integer.parse(Enum.at(arguments,0))
    {last,""}=Integer.parse(Enum.at(arguments,1))

    {:ok,sup_id}=Supervisor1.start_link(first,last)
    children= :supervisor.which_children(sup_id)
    for child <- children, do: Enum.each(GenServer1.get_results(elem(child,1)),fn x-> IO.puts x end)
    {:ok,sup_id}
  end
end



