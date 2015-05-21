class Robot
  attr_reader :title,
              :description,
              :id,
              :city,
              :state,
              :job,
              :department


  def initialize(data)
    @id          = data["id"]
    @title       = data["title"]
    @description = data["description"]
    @city        = data["city"]
    @state       = data["state"]
    @job         = data["job"]
    @department  = data["department"]
  end
end
