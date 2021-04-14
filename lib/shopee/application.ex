defmodule Shopee.Application do
    use Application
    require Logger

    def start(_type, _args) do
      children = [
        {Plug.Cowboy, scheme: :http, plug: Shopee.Api, options: [port: 8000]}
      ]
      opts = [strategy: :one_for_one, name: Shopee.Supervisor]

      Logger.info("Starting application with localhost:8000")

      Supervisor.start_link(children, opts)
    end
  end
