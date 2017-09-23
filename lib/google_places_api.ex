defmodule GooglePlacesApi do
  @moduledoc """
  Documentation for GooglePlacesApi.
  """
  use HTTPoison.Base

  @doc """
  Hello world.

  ## Examples

      iex> GooglePlacesApi.hello
      :world

  """
  @api_key Application.get_env(:google_places_api, :key)
  @near_by_search "/place/nearbysearch/json"

  @doc """
  Search places via google maps API.

  ## Examples

  iex> GooglePlacesApi.search({long, lat}) {data about google search}

  """

  def search(place) is_binary(place) do
    place
  end

  def hello do
    :world
  end
end
