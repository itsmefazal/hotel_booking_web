require "application_system_test_case"

class RoomCategoriesTest < ApplicationSystemTestCase
  setup do
    @room_category = room_categories(:one)
  end

  test "visiting the index" do
    visit room_categories_url
    assert_selector "h1", text: "Room categories"
  end

  test "should create room category" do
    visit room_categories_url
    click_on "New room category"

    fill_in "Capacity", with: @room_category.capacity
    fill_in "Facilities", with: @room_category.facilities
    fill_in "Name", with: @room_category.name
    fill_in "Price", with: @room_category.price
    click_on "Create Room category"

    assert_text "Room category was successfully created"
    click_on "Back"
  end

  test "should update Room category" do
    visit room_category_url(@room_category)
    click_on "Edit this room category", match: :first

    fill_in "Capacity", with: @room_category.capacity
    fill_in "Facilities", with: @room_category.facilities
    fill_in "Name", with: @room_category.name
    fill_in "Price", with: @room_category.price
    click_on "Update Room category"

    assert_text "Room category was successfully updated"
    click_on "Back"
  end

  test "should destroy Room category" do
    visit room_category_url(@room_category)
    click_on "Destroy this room category", match: :first

    assert_text "Room category was successfully destroyed"
  end
end
