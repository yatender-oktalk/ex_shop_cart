defmodule RegisterUser do
  @derive {Inspect, only: [:id, :name]}
  defstruct [:id, :name, :password]
end
