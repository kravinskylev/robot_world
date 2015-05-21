require_relative '../test_helper'

class CreateNewRobotTest < FeatureTest
  def test_user_can_create_new_robot
    visit '/robots/new'
    fill_in 'robot[title]', :with => 'new title'
    fill_in 'robot[description]', :with => 'new description'
    click_button('Submit')
    assert page.has_content?("new title")
  end
end
