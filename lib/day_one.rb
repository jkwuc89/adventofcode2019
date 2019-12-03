class DayOne
  def calculate_fuel_for_module(mass:)
    (mass / 3).floor - 2
  end

  def sum_fuel_for_all_modules(modules:)
    modules.inject(0) { |sum, m| sum + (calculate_fuel_for_module(:mass => m)) }
  end
end

