defmodule StocksWeb.TestController do
  use StocksWeb, :controller

  def index(conn, params) do
    params = params["t"]
    params = params["query"]
    url = "https://www.alphavantage.co/query?function=OVERVIEW&symbol=#{params}&apikey=80T6QSIWOJ891MM5"
    test =
      HTTPoison.get!(url)

     test_decode = Jason.decode!(test.body)
    render(conn, "index.html", test: test_decode)
  end
end
