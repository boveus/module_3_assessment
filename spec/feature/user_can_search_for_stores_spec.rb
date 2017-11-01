require 'rails_helper'

feature "As a user, when I visit '/' and search for '80202'" do
  it "should redirect me to '/search' and I should see stores
  within 25 miles of that zip code" do

    @first_store = {"city"=>"Denver",
                     "longName"=>"Cherry Creek Shopping Center",
                     "distance"=> 3.45,
                     "phone"=> "303-270-9189",
                     "storeType"=>"Mobile SAS"}

    visit "/"
    fill_in "search_box", with: "80202"
    click_on "Search"

    expect(page).to have_content("17 Total Stores")
    
    expect(page).to have_selector('#store', count: 10)

    expect(page).to have_content(@first_store.long_name)
    expect(page).to have_content(@first_store.city)
    expect(page).to have_content(@first_store.distance)
    expect(page).to have_content(@first_store.phone_number)
    expect(page).to have_content(@first_store.store_type)
  end
end



# As a user
# When I visit "/"
# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "17 Total Stores"
# And I should see exactly 10 results (There are 17 stores within 25 miles. We want to display 10 on this page and 7 on the next. Get the first page to work first from start to finish and worry about pagination later.)
# And I should see the long name, city, distance, phone number and store type for each of the 10 results
