require_relative '../test_helper'

class CreateNewRobotTest < FeatureTest
  def create_robot
    visit '/robots/new'
    fill_in 'robot[title]', :with => 'title'
    fill_in 'robot[description]', :with => 'description'
    click_button 'Submit'
  end

  def test_user_can_edit_robot
    RobotWorld.create(title: "title",
                       description: "tonight")

    visit '/robots/1/edit'
    fill_in 'robot[title]', :with => 'new title'
    fill_in 'robot[description]', :with => 'new description'
    click_button 'update robot'
    visit '/robots'

    assert page.has_content? 'new title'
  end
end
