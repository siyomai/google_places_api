# google_places_api

A simple lightweight API wrapper for the google places api

  ## Search
  GooglePlacesApi.search({latitude, longitude}, type, radius \\ 50, result_limit \\ 5)
  Search places via google places API using latitude and longitude within a 50 meter radius.

    iex> GooglePlacesApi.search({51.51316, -0.13118}, "restaurant")
    {:ok, %{results: results}}

  ## Text Search
  GooglePlacesApi.text_search(query, result_limit \\ 5)
  Search places via google places API using a query string.


    iex> GooglePlacesApi.text_search("restaurants in soho")
    {:ok, %{results: results}}


## Installation

the package can be installed by adding `google_places_api` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:google_places_api, "~> 0.1.0"}
  ]
end
```
## Configure
  ```
  config :google_places_api, key: "add google api key here"
  ```
