require_relative '../test_helper'

class HomePageTest < FeatureTest
  def test_user_sees_index_and_new_links
    visit '/'
      within('#welcome-header') do
        assert page.has_content?("Robot World")
      end
  end

  def test_user_can_click_new_robot
    visit '/'
    click_link('New Robot')
    assert_equal current_path, '/robots/new'
  end
end
