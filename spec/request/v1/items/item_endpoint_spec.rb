require 'rails_helper'

feature "When I send a GET request to /api/v1/items/1" do
  it "returns a 200 JSON response containing the id, name,
   description, and image_url but not the created_at or updated_at" do

      @expected = {
        :flashcard  => @flashcard,
        :lesson     => @lesson,
        :success    => true
      }.to_json

      visit '/api/v1/items/1'

      expect(response.body).to have_content(@expected)
   end
end

#
# I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at
