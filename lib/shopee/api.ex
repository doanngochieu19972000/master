defmodule Shopee.Api do
    import Phoenix.Controller
    import Plug.Conn
    use Plug.Router
    require Logger
    require Http
    require Crawly.Spider

    plug :match
    plug :dispatch

    get "/apple_flagship_store" do
      conn
      |> put_resp_header("content-type", "text/html; charset=utf-8")
      |> send_file(200, "lib/shopee/template/apple_flagship_store.html")
    end

    get "/api/apple_flagship_store" do
      conn = fetch_query_params(conn)

      shopid = conn.params["shopid"]

      result = Http.gets("https://shopee.vn/api/v2/shop/get_categories?limit=20&offset=0&shopid=#{shopid}")
      Logger.info(result)
      json(conn, Poison.decode!(result))
    end

    get "/api/apple_flagship_store_detail" do
      conn = fetch_query_params(conn)

      shop_detailid = conn.params["shop_detailid"]

      result = Http.gets("http://104.131.33.149:7000/products/#{shop_detailid}")

      json(conn, Poison.decode!(result))
    end

    get "/css/bootstrap-responsive.min.css" do
      conn
      |> put_resp_header("content-type", "text/css; charset=utf-8")
      |> send_file(200, "lib/shopee/template/css/bootstrap-responsive.min.css")
    end

    get "/css/bootstrap.min.css" do
      conn
      |> put_resp_header("content-type", "text/css; charset=utf-8")
      |> send_file(200, "lib/shopee/template/css/bootstrap.min.css")
    end

    get "/js/angular.min.js" do
      conn
      |> put_resp_header("content-type", "text/js; charset=utf-8")
      |> send_file(200, "lib/shopee/js/angular.min.js")
    end

    get "/js/controller/app.js" do
      conn
      |> put_resp_header("content-type", "text/js; charset=utf-8")
      |> send_file(200, "lib/shopee/js/controller/app.js")
    end

    get "/js/puppeteer.min.js" do
      conn
      |> put_resp_header("content-type", "text/js; charset=utf-8")
      |> send_file(200, "node_modules/puppeteer/lib/type.d.ts.js")
    end

    match _ do
      send_resp(conn, 200, "Opp!")
    end
  end
