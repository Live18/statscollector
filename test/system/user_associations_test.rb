require "application_system_test_case"

class UserAssociationsTest < ApplicationSystemTestCase
  setup do
    @user_association = user_associations(:one)
  end

  test "visiting the index" do
    visit user_associations_url
    assert_selector "h1", text: "User Associations"
  end

  test "creating a User association" do
    visit user_associations_url
    click_on "New User Association"

    fill_in "Team", with: @user_association.team_id
    fill_in "User", with: @user_association.user_id
    click_on "Create User association"

    assert_text "User association was successfully created"
    click_on "Back"
  end

  test "updating a User association" do
    visit user_associations_url
    click_on "Edit", match: :first

    fill_in "Team", with: @user_association.team_id
    fill_in "User", with: @user_association.user_id
    click_on "Update User association"

    assert_text "User association was successfully updated"
    click_on "Back"
  end

  test "destroying a User association" do
    visit user_associations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User association was successfully destroyed"
  end
end
