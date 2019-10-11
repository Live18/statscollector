require 'test_helper'

class UserAssociationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_association = user_associations(:one)
  end

  test "should get index" do
    get user_associations_url
    assert_response :success
  end

  test "should get new" do
    get new_user_association_url
    assert_response :success
  end

  test "should create user_association" do
    assert_difference('UserAssociation.count') do
      post user_associations_url, params: { user_association: { team_id: @user_association.team_id, user_id: @user_association.user_id } }
    end

    assert_redirected_to user_association_url(UserAssociation.last)
  end

  test "should show user_association" do
    get user_association_url(@user_association)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_association_url(@user_association)
    assert_response :success
  end

  test "should update user_association" do
    patch user_association_url(@user_association), params: { user_association: { team_id: @user_association.team_id, user_id: @user_association.user_id } }
    assert_redirected_to user_association_url(@user_association)
  end

  test "should destroy user_association" do
    assert_difference('UserAssociation.count', -1) do
      delete user_association_url(@user_association)
    end

    assert_redirected_to user_associations_url
  end
end
