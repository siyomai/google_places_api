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

