module DamageModifier

  Modifiers = {
    Footman: {
      Barracks: 0.5
    },
    SiegeEngine: {
      SiegeEngine: 1,
      Barracks: 2
    }
  }

  Modifiers[:SiegeEngine].default = 0

  def get_damage_modifier(attacker,enemy)
    attacker_key = attacker.class.to_s.to_sym
    enemy_key = enemy.class.to_s.to_sym


    enemy_hash = Modifiers[attacker_key]

    if enemy_hash && enemy_hash.include?(enemy_key)
      enemy_hash[enemy_key]
    else
      return enemy_hash.default if enemy_hash && enemy_hash.default
      1
    end
  end

end
