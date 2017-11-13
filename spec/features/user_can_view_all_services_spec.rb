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

  it "they can create a new order" do
    visit new_service_order_path(@service)

    expect(page).to have_field("order[start_time]")
    expect(page).to have_field("order[end_time]")

    fill_in "order[start_time]", with: "2017-11-13 16:46:10 -0700"
    fill_in "order[end_time]", with: "2017-11-13 16:50:10 -0700"

    click_button "Create Order"

    expect(current_path).to eq(service_order_path(@service, Order.last))
  end
end