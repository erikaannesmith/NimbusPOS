require 'rails_helper'

describe "User visits services index" do
  before :each do 
    @service = Service.create(name: "Mahjong 1", status: "open", hourly_rate: 40)
  end

  it "they see buttons for each service" do
    visit root_path

    expect(page).to have_link("Mahjong 1")
    click_on "Mahjong 1"

    expect(current_path).to eq(new_service_order_path(@service))
  end
end