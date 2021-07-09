defmodule StocksWeb.PageLive do
  use StocksWeb, :live_view
  alias HTTPoison

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, query: "", results: %{}, test: %{})}
  end

  @impl true
  def handle_event("search", %{"query" => query}, socket) do
    IO.inspect "test"
    url = "https://www.alphavantage.co/query?function=OVERVIEW&symbol=#{query}&apikey=80T6QSIWOJ891MM5"
    test =
      HTTPoison.get!(url)

     test_decode = Jason.decode!(test.body)
    {:noreply, assign(socket, results: query, query: query, test: test_decode)}
  end

end
