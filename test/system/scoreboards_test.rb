require "application_system_test_case"

class ScoreboardsTest < ApplicationSystemTestCase
  setup do
    @scoreboard = scoreboards(:one)
  end

  test "visiting the index" do
    visit scoreboards_url
    assert_selector "h1", text: "Scoreboards"
  end

  test "creating a Scoreboard" do
    visit scoreboards_url
    click_on "New Scoreboard"

    fill_in "Away team fouls", with: @scoreboard.away_team_fouls
    fill_in "Away team score", with: @scoreboard.away_team_score
    fill_in "Away team timeouts remining", with: @scoreboard.away_team_timeouts_remining
    fill_in "Home team fouls", with: @scoreboard.home_team_fouls
    fill_in "Home team score", with: @scoreboard.home_team_score
    fill_in "Home team timeouts remaining", with: @scoreboard.home_team_timeouts_remaining
    fill_in "Period", with: @scoreboard.period
    fill_in "Posession arrow", with: @scoreboard.posession_arrow
    click_on "Create Scoreboard"

    assert_text "Scoreboard was successfully created"
    click_on "Back"
  end

  test "updating a Scoreboard" do
    visit scoreboards_url
    click_on "Edit", match: :first

    fill_in "Away team fouls", with: @scoreboard.away_team_fouls
    fill_in "Away team score", with: @scoreboard.away_team_score
    fill_in "Away team timeouts remining", with: @scoreboard.away_team_timeouts_remining
    fill_in "Home team fouls", with: @scoreboard.home_team_fouls
    fill_in "Home team score", with: @scoreboard.home_team_score
    fill_in "Home team timeouts remaining", with: @scoreboard.home_team_timeouts_remaining
    fill_in "Period", with: @scoreboard.period
    fill_in "Posession arrow", with: @scoreboard.posession_arrow
    click_on "Update Scoreboard"

    assert_text "Scoreboard was successfully updated"
    click_on "Back"
  end

  test "destroying a Scoreboard" do
    visit scoreboards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Scoreboard was successfully destroyed"
  end
end
