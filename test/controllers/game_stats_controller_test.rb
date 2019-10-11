require 'test_helper'

class GameStatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_stat = game_stats(:one)
  end

  test "should get index" do
    get game_stats_url
    assert_response :success
  end

  test "should get new" do
    get new_game_stat_url
    assert_response :success
  end

  test "should create game_stat" do
    assert_difference('GameStat.count') do
      post game_stats_url, params: { game_stat: { ast: @game_stat.ast, game_id: @game_stat.game_id, player_id: @game_stat.player_id, pts: @game_stat.pts, reb: @game_stat.reb, stls: @game_stat.stls } }
    end

    assert_redirected_to game_stat_url(GameStat.last)
  end

  test "should show game_stat" do
    get game_stat_url(@game_stat)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_stat_url(@game_stat)
    assert_response :success
  end

  test "should update game_stat" do
    patch game_stat_url(@game_stat), params: { game_stat: { ast: @game_stat.ast, game_id: @game_stat.game_id, player_id: @game_stat.player_id, pts: @game_stat.pts, reb: @game_stat.reb, stls: @game_stat.stls } }
    assert_redirected_to game_stat_url(@game_stat)
  end

  test "should destroy game_stat" do
    assert_difference('GameStat.count', -1) do
      delete game_stat_url(@game_stat)
    end

    assert_redirected_to game_stats_url
  end
end
