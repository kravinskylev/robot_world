require_relative '../test_helper'

class CreateNewRobotTest < FeatureTest
  def create_robot
    visit '/robots/new'
    fill_in 'robot[title]', :with => 'title'
    fill_in 'robot[description]', :with => 'description'
    click_button 'Submit'
  end

  def test_user_can_delete_robot
    create_robot

    visit '/robots/1'
    click_link_or_button 'delete'
    visit '/robots'

    refute page.has_content? 'title'
  end
end
