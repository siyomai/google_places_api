defmodule GooglePlacesApi do
  @moduledoc """
  A simple lightweight API wrapper for the google places api
  """
  use HTTPoison.Base

  @api_key Application.get_env(:google_places_api, :key)
  @base_url "https://maps.googleapis.com/maps/api"
  @near_by_search "/place/nearbysearch/json"
  @text_search "/place/textsearch/json"

  @doc """
  GooglePlacesApi.search({latitude, longitude}, type, radius \\ 50, result_limit \\ 5)
  Search places via google places API using latitude and longitude within a 50 meter radius.


  ## Examples

  iex> GooglePlacesApi.search({51.51316, -0.13118}, "restaurant")
  {:ok, %{results: results}}

  """

  def search({lat, long}, type, radius \\ 50, result_limit \\ 5) do
    result =
      get!(@near_by_search <> "?location=#{lat},#{long}&radius=#{radius}&type=#{type}&key=#{@api_key}")

    case result do
      %HTTPoison.Response{body: %{"results" => results, "status" => "OK"}} ->
        {:ok, %{results: limit(results, result_limit)}}
      %HTTPoison.Response{body: %{"status" => message}} ->
        {:error, message}
    end
  end

  @doc """
  GooglePlacesApi.text_search(query, result_limit \\ 5)
  Search places via google places API using a query string.


  ## Examples

  iex> GooglePlacesApi.text_search("restaurants in soho")
  {:ok, %{results: results}}

  """

  def text_search(query, result_limit \\ 5) do
    result =
      get!(@text_search <> "?query=#{format_for(query)}&key=#{@api_key}")

    case result do
      %HTTPoison.Response{body: %{"results" => results, "status" => "OK"}} ->
        {:ok, %{results: limit(results, result_limit)}}
      %HTTPoison.Response{body: %{"status" => message}} ->
        {:error, message}
    end
  end

  defp limit(list, num, acc \\ [])
  defp limit(_list, 0, acc), do: acc
  defp limit([], _num, acc), do: acc
  defp limit([head | tail], num, acc) do
    num = num - 1
    limit(tail, num, List.insert_at(acc, -1, head))
  end

  defp format_for(query), do: String.replace(query, " ", "+")

  def process_url(url), do: @base_url <> url

  def process_response_body(body) do
    body
    |> Poison.decode!
  end
end
