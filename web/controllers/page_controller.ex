defmodule Wtfis.PageController do
  use Wtfis.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
