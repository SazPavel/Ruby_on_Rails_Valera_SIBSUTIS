class DerValera < ApplicationRecord
  attr_reader :health, :mana, :cheerfulness, :fatigue, :money

  def initialize(health = 100, mana = 0,
                 cheerfulness = 0, fatigue = 0, money = 100)

    @health = @mana = @fatigue = @cheerfulness = @money = 0

    health!(health)
    mana!(mana)
    cheerfulness!(cheerfulness)
    fatigue!(fatigue)
    money!(money)
  end

  def reinitialize!(health = 100, mana = 0,
                    cheerfulness = 0, fatigue = 0, money = 100)
    initialize(health, mana, cheerfulness, fatigue, money)
  end

  def change_properties!(property, value)
    send(property.to_s + '!', value)
  end

  def alive?
    @health.positive?
  end

  private

  def health!(health)
    @health = check_borders(@health + health.to_i, 0, 100)
  end

  def mana!(mana)
    @mana = check_borders(@mana + mana.to_i, 0, 100)
  end

  def cheerfulness!(cheerfulness)
    @cheerfulness = check_borders(@cheerfulness + cheerfulness.to_i, -10, 10)
  end

  def fatigue!(fatigue)
    @fatigue = check_borders(@fatigue + fatigue.to_i, 0, 100)
  end

  def money!(money)
    @money = check_borders(@money + money.to_i, 0, Float::INFINITY)
  end

  def check_borders(property, min_border, max_border)
    [[property, min_border].max, max_border].min
  end
end
