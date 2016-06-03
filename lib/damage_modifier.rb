module DamageModifier

  def make
    @modifiers = {
      Footman => {
        Barracks => 0.5
      },
      SiegeEngine => {
        SiegeEngine => 1,
        Unit => 0,
        Barracks => 2
      },
      Unit => {
        Unit => 1
      }
    }
  end

  def get_damage_modifier(attacker,attacked)
    make if @modifiers.nil? #Total hack...

    @modifiers.each do |attack_class,modifier_hash|
      if attacker.is_a? attack_class
        modifier_hash.each do |attacked_class,modifier|
          if attacked.is_a? attacked_class
            return modifier
          end
        end
      end
    end
  end

end
