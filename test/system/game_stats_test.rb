require "application_system_test_case"

class GameStatsTest < ApplicationSystemTestCase
  setup do
    @game_stat = game_stats(:one)
  end

  test "visiting the index" do
    visit game_stats_url
    assert_selector "h1", text: "Game Stats"
  end

  test "creating a Game stat" do
    visit game_stats_url
    click_on "New Game Stat"

    fill_in "Ast", with: @game_stat.ast
    fill_in "Game", with: @game_stat.game_id
    fill_in "Player", with: @game_stat.player_id
    fill_in "Pts", with: @game_stat.pts
    fill_in "Reb", with: @game_stat.reb
    fill_in "Stls", with: @game_stat.stls
    click_on "Create Game stat"

    assert_text "Game stat was successfully created"
    click_on "Back"
  end

  test "updating a Game stat" do
    visit game_stats_url
    click_on "Edit", match: :first

    fill_in "Ast", with: @game_stat.ast
    fill_in "Game", with: @game_stat.game_id
    fill_in "Player", with: @game_stat.player_id
    fill_in "Pts", with: @game_stat.pts
    fill_in "Reb", with: @game_stat.reb
    fill_in "Stls", with: @game_stat.stls
    click_on "Update Game stat"

    assert_text "Game stat was successfully updated"
    click_on "Back"
  end

  test "destroying a Game stat" do
    visit game_stats_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Game stat was successfully destroyed"
  end
end
