# google_places_api

A simple lightweight API wrapper for the google places api

  GooglePlacesApi.search({latitude, longitude}, type, radius \\ 50, result_limit \\ 5)
  Search places via google places API using latitude and longitude within a 50 meter radius.


  ## Search

  iex> GooglePlacesApi.search({51.51316, -0.13118}, "restaurant")
  {:ok, %{results: results}}


  ## Text Search

  iex> GooglePlacesApi.text_search("restaurants in soho")
  {:ok, %{results: results}}

