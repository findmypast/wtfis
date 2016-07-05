defmodule Wtfis.QueryController do
  use Wtfis.Web, :controller

  def query(conn, params) do
    params["text"]
    |> query_github
    |> Poison.Parser.parse!
    |> Map.get("description")
    |> send_response(conn)
  end

  defp send_response(nil, conn) do
    json conn, %{ text: "Not found", response_type: "in_channel" }
  end

  defp send_response(text, conn) do
    json conn, %{ text: text, response_type: "in_channel" }
  end

  defp query_github(name) do
    HTTPotion.get("https://api.github.com/repos/findmypast/#{name}", headers: ["User-Agent": "FindMyPast-wtfis"]).body
  end

end
