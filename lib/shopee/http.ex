defmodule Http do
  require Logger



  def init(opts), do: {:ok, opts}

  def get(url) do
    url
    |> HTTPoison.get!
    |> Map.fetch(:body)
  end

  def gets(url) do
    headers = ["Referer": "https://shopee.vn/apple_flagship_store"]
    options = []

    {:ok, data} = HTTPoison.get(url, headers, options)

    result = data.body
  end
end
