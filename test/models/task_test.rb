require_relative '../test_helper'

class RobotTest < Minitest::Test
  def test_it_correctly_assigns_attributes
    data = { "title"       => "a title",
              "description" => "a description",
              "id"          => 1 }

    robot = Robot.new(data)

    assert_equal "a title", robot.title
    assert_equal "a description", robot.description
    assert_equal 1, robot.id
  end
end
