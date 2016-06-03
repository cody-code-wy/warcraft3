class Unit
  attr_reader :health_points, :attack_power

  include Health, DamageModifier

  def initialize(health,attack)
    @health_points = health
    @attack_power = attack
  end

  def can_attack?(enemy)
    ! ( dead? || enemy.dead? )
  end

  def attack!(enemy)
    modifier = get_damage_modifier(self,enemy)
    enemy.damage((attack_power * modifier).ceil) if can_attack? enemy
  end

end
