defmodule GooglePlacesApiTest do
  use ExUnit.Case
  import Mock

  describe "GooglePlacesApi" do
    @result {:ok,
             %{results: [
                  %{"geometry" =>
                     %{"location" =>
                        %{"lat" => 51.5135064, "lng" => -0.1313178},
                       "viewport" =>
                         %{"northeast" =>
                            %{"lat" => 51.5148422802915,
                              "lng" => -0.130016919708498},
                           "southwest" => %{"lat" => 51.5121443197085,
                                            "lng" => -0.132714880291502}}},
                    "icon" => "https://maps.gstatic.com/mapfiles/place_api/icons/restaurant-71.png",
                    "id" => "32e6732440fba24d48d8f9359adb4e3536cb5347",
                    "name" => "Little Italy Restaurant",
                    "opening_hours" => %{"open_now" => false, "weekday_text" => []},
                    "photos" => [%{"height" => 1365,
                                   "html_attributions" => ["<a href=\"https://maps.google.com/maps/contrib/104111246635874032234/photos\">ZAGAT</a>"],
                                   "photo_reference" => "CmRaAAAAITJicDLCdnHCwnYPxgpIwzXC2zqA4imT4ZXIlvQO-EYCCBHtyLC5p0eNMMQ_cLC7x3xOu9Z6sQXpoGFmnsLVvfAXWcpqsqado5fZw32zwu5-zRWDQEFHJMnUJuadJZD-EhAjB8Yer7S7P_JTt2O6lOJwGhQC_PhW_6TUjnHzCwGeGAbm3ZPrbA",
                                   "width" => 2048}], "place_id" => "ChIJZRN66NIEdkgRkrS87zNISPc",
                    "price_level" => 3, "rating" => 3.2,
                    "reference" => "CmRSAAAA-omv3-xEG_vrP2Nwy3APZ1rDWWQ72NAco86Z4_wWt29fSYdeRVgdXkZg9YeTK4qI3bzKKC_q_clGnuiAPXoqqCgPa1rTrphMCo5m10gfeb9WbbCqXX9UDycK0Ury_S1tEhAWMW7Uzl0XH5ZXF2-aj9uUGhQhb9GXKmZqDjqqq-h3f3Yq69nh2A",
                    "scope" => "GOOGLE",
                    "types" => ["bar", "restaurant", "food", "point_of_interest",
                                "establishment"], "vicinity" => "21 Frith Street, London"
                   }
                ]
             }
    }

    test "search/4 with latitude longitude and type" do
      with_mock GooglePlacesApi, [search: fn(_coordinates, _type) -> @result end] do
        {:ok, %{results: results}} = GooglePlacesApi.search({51.51316, -0.13118}, "restaurant")
        assert length(results) > 0
        assert List.first(results)["name"] == "Little Italy Restaurant"
      end
    end

    test "text_search/2 with search query and type" do
      with_mock GooglePlacesApi, [text_search: fn(_search) -> @result end] do
        {:ok, %{results: results}} = GooglePlacesApi.text_search("Richmonde Plaza Ortigas")
        assert length(results) > 0
        assert List.first(results)["name"] == "Little Italy Restaurant"
      end
    end
  end
end
