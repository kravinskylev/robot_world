require 'yaml/store'
require_relative 'robot'

class RobotManager
  def self.database
    @database ||= YAML::Store.new("db/robot_manager")
  end

  def self.create(robot)
    database.transaction do
      database['robots'] ||= []
      database['total'] ||= 0
      database['total'] += 1
      database['robots'] << { "id"          => database['total'],
                              "title"       => robot[:title],
                              "description" => robot[:description],
                              "city"        => robot[:city],
                              "state"       => robot[:state],
                              "job"         => robot[:job],
                              "department"  => robot[:department]}
    end
  end

  def self.raw_robots
    database.transaction do
      database['robots'] || []
    end
  end

  def self.all
    raw_robots.map { |data| Robot.new(data) }
  end

  def self.raw_robot(id)
    raw_robots.find { |robot| robot["id"] == id }
  end

  def self.find(id)
    Robot.new(raw_robot(id))
  end

  def self.update(id, data)
    database.transaction do
      target = database['robots'].find { |element| element["id"] == id }
      target["title"]       = data[:title]
      target["description"] = data[:description]
      target["job"]         = data[:job]
      target["city"]        = data[:city]
      target["state"]       = data[:state]
      target["department"]  = data[:department]
    end
  end

  def self.delete(id)
    database.transaction do
      database["robots"].delete_if { |robot| robot["id"] == id}
    end
    end
end
