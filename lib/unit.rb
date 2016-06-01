class Unit
  attr_reader :health_points, :attack_power

  def initialize(health,attack)
    @health_points = health
    @attack_power = attack
  end

  def damage(ammount)
    @health_points -= ammount
  end

  def attack!(enemy)
    enemy.damage(attack_power)
  end

end
