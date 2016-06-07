defmodule Wtfis.QueryController do
  use Wtfis.Web, :controller

  def query(conn, params) do
    params["text"]
    |> query_github
    |> Poison.Parser.parse!
    |> Map.get("description")
    |> send_response(conn)
  end

  defp send_response(text, conn) do
    json conn, %{ text: text, response_type: "in_channel" }
  end

  defp query_github(name) do
    HTTPotion.get("api.github.com/repos/findmypast/#{name}")
    |> Map.get(:body)
  end

end
