class Robot
  attr_reader :title,
              :description,
              :id,
              :city

  def initialize(data)
    @id          = data["id"]
    @title       = data["title"]
    @description = data["description"]
    @city        = data["city"]
  end
end
