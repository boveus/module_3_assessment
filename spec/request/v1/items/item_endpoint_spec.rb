require 'rails_helper'

feature "When I send a GET request to /api/v1/items/1" do
  it "returns a 200 JSON response containing the id, name,
   description, and image_url but not the created_at or updated_at" do

      item = Item.create(id: 1,
                    name: "Awesome Marble Plate",
                    description: "Omnis corporis voluptas voluptatem et cum placeat quas. Aut tempore voluptas minus. Ea odit ipsa. Est sed beatae est sunt nulla.",
                    image_url: "http://robohash.org/0.png?set=set2u0026bgset=bg1u0026size=200x200",
                    created_at: "2017-11-01 02:03:07",
                    updated_at: "2017-11-01 02:03:07"
                    )

      @expected = "{\"id\":1,\"name\":\"Awesome Marble Plate\",\"description\":\"Omnis corporis voluptas voluptatem et cum placeat quas. Aut tempore voluptas minus. Ea odit ipsa. Est sed beatae est sunt nulla.\",\"image_url\":\"http://robohash.org/0.png?set=set2u0026bgset=bg1u0026size=200x200\"}"
      visit '/api/v1/items/1'

      expect(page).to have_content(@expected["id"])
      expect(page).to have_content(@expected["name"])
      expect(page).to have_content(@expected["description"])
      expect(page).to have_content(@expected["image_url"])
      expect(page).to_not have_content(item.created_at)
      expect(page).to_not have_content(item.updated_at)
   end
end

#
# I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at
