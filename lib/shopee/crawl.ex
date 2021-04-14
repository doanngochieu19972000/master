defmodule Esl do
  use Crawly.Spider
  require Logger

  @impl Crawly.Spider
  def base_url() do
    "https://shopee.vn/apple_flagship_store"
  end

  @impl Crawly.Spider
  def init() do
    [
      start_urls: ["https://shopee.vn/apple_flagship_store"]
    ]
  end

  @impl Crawly.Spider
  def parse_item(response) do
    text = Floki.find(response.body, "._1Rnhan")
    |> Enum.map(&Floki.text/1)
    |> Floki.text()

    %Crawly.ParsedItem{
      :items => [
        %{text: text}
      ]
    }

  end
end
