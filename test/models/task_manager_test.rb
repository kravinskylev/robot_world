require_relative '../test_helper'
  class RobotWorldTest < Minitest::Test
    def create_robots
      data = { :title       => "learn sinatra",
                :description => "seriously."}

      data2 ={ :title        => "new title",
                :description  => "new description"}

      data3 ={ :title        => "new title1",
                :description  => "new description1"}
      RobotWorld.create(data)
      RobotWorld.create(data2)
      RobotWorld.create(data3)
    end

    def test_it_can_create_a_robot
      create_robots
      robot = RobotWorld.find(1)

      assert_equal "learn sinatra", robot.title
      assert_equal "seriously.", robot.description
      assert_equal 1, robot.id
    end

    def test_it_return_all
      create_robots

      assert_equal 1, RobotWorld.all.first.id
      assert_equal 3, RobotWorld.all.length
    end

    def test_it_can_update_a_robot
      create_robots
      data2 = { :title        => "new title",
                :description  => "new description"}

      robot = RobotWorld.find(1)

      assert_equal "learn sinatra", robot.title
      assert_equal "seriously.", robot.description
      assert_equal 1, robot.id

      RobotWorld.update(1, data2)
      robot = RobotWorld.find(1)

      assert_equal "new title", robot.title
      assert_equal "new description", robot.description
      assert_equal 1, robot.id
    end

    def test_it_can_destroy_robot
      create_robots

      assert_equal 3, RobotWorld.all.length
      assert_equal 1, RobotWorld.all.first.id

      RobotWorld.delete(1)

      assert_equal 2, RobotWorld.all.length
      assert_equal 2, RobotWorld.all.first.id
    end

    def test_it_can_find_by_id
      create_robots

      assert_equal 2, RobotWorld.find(2).id
    end
  end

#destroy, find
