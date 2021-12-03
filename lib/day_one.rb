# frozen_string_literal: true

class DayOne
  def calculate_fuel_for_mass(mass:)
    (mass / 3).floor - 2
  end

  def calculate_fuel_for_module_mass(module_mass:)
    current_mass = module_mass
    module_fuel = 0

    loop do
      mass_for_fuel = calculate_fuel_for_mass(mass: current_mass)
      break if mass_for_fuel <= 0

      module_fuel += mass_for_fuel
      current_mass = mass_for_fuel
    end

    module_fuel
  end

  def puzzle_one_sum_fuel_for_all_modules(modules:)
    modules.inject(0) { |sum, m| sum + calculate_fuel_for_mass(mass: m) }
  end

  def puzzle_two_sum_fuel_for_all_modules(modules:)
    modules.inject(0) { |sum, m| sum + calculate_fuel_for_module_mass(module_mass: m) }
  end
end
