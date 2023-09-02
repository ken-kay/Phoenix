defmodule Practice.SevenCont do
  defstruct name: "", continent: ""
  alias Practice.SevenCont

  @type t :: %SevenCont{
    name: String.t(),
    continent: String.t()
  }

  @spec all() :: [t()]
  def all() do
    [
      %SevenCont{name:"Kenani", continent:"Africa"},
      %SevenCont{name:"Gaetan", continent:"Antarctica"},
      %SevenCont{name:"Ken", continent:"Asia"},
      %SevenCont{name:"Steve", continent:"Europe"},
      %SevenCont{name:"Tea", continent:"North America"},
      %SevenCont{name:"Marcos", continent:"South America"},
      %SevenCont{name:"Jennifer", continent:"Oceania"}
    ]
  end

  def print_list(seven) do
    Enum.each(seven, fn %{name: name} -> IO.puts(name) end)
  end

end
