defmodule ChatouriusWeb.RoomChannel do
  use Phoenix.Channel
  
  def join("room", _payload, socket) do
    {:ok, socket}
  end
end