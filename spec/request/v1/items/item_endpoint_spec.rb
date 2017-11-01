require 'rails_helper'

feature "When I send a GET request to /api/v1/items/1" do
  before(:each) do
    item = Item.create(id: 1,
                  name: "Awesome Marble Plate",
                  description: "Omnis corporis voluptas voluptatem et cum placeat quas. Aut tempore voluptas minus. Ea odit ipsa. Est sed beatae est sunt nulla.",
                  image_url: "http://robohash.org/0.png?set=set2u0026bgset=bg1u0026size=200x200",
                  created_at: "2017-11-01 02:03:07",
                  updated_at: "2017-11-01 02:03:07"
                  )
  end

  it "returns a 200 JSON response containing the id, name,
   description, and image_url but not the created_at or updated_at" do
    @expected = "{\"id\":1,\"name\":\"Awesome Marble Plate\",\"description\":\"Omnis corporis voluptas voluptatem et cum placeat quas. Aut tempore voluptas minus. Ea odit ipsa. Est sed beatae est sunt nulla.\",\"image_url\":\"http://robohash.org/0.png?set=set2u0026bgset=bg1u0026size=200x200\"}"

    @unexpected = "{\"created_at\":\"2017-11-01T02:03:07.979Z\",\"updated_at\":\"2017-11-01T02:03:07.979Z\"}"
    visit '/api/v1/items/1'

    @expected_json = JSON.parse(@expected)
    @unexpected_json = JSON.parse(@unexpected)

    expect(page).to have_content(@expected_json["id"])
    expect(page).to have_content(@expected_json["name"])
    expect(page).to have_content(@expected_json["description"])
    expect(page).to have_content(@expected_json["image_url"])
    expect(page).not_to have_content(@unexpected_json["created_at"])
    expect(page).not_to have_content(@unexpected_json["updated_at"])
   end
 end
feature "When I send a DELETE request to /api/v1/items/1" do
  it "Returns a a 204 JSON response if the record is successfully deleted" do
    page.driver.submit :delete, "api/v1/items/1", {}
    expect(response.status).to eq(204)
  end
end
