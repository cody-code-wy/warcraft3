module Health
  attr_reader :health_points

  def damage(ammount)
    @health_points -= ammount
  end

  def dead?
    health_points <= 0
  end
end
