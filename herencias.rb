class Vehicle
  attr_reader :age, :color, :tank_size, :refuel, :number_of_gears
  def initialize
    @age = 0
    @color = "Black"
    @tank_size = 50
    @refuel = true
  end

  def age!
  @age = @age + 1
  end

  def has_wheels?
  true
  end

  def what_am_i?
    self.class
    # Este método va a ser utilizado por varias clases y deberá regresar
    # el nombre de la clase desde la cual se corrió.
    # ej.
    # bocho = Car.new
    # bocho.what_am_i? => Car
  end
end

class Motorized < Vehicle
  attr_reader :has_motor, :refuel, :number_of_gears

  def initialize
    super
    @has_motor = true
    @tank_size = 15
    @refuel = true
  end
end
class Motorless < Vehicle
  attr_reader :has_motor, :tank_size, :refuel
  def initialize
    super
    @has_motor = false
    @tank_size = false
    @refuel = false
  end
end
class Motorbike < Motorized
  attr_reader :number_of_wheels
  def initialize
    super
    @number_of_wheels = 2
  end
end

class Car < Motorized
  attr_reader :number_of_wheels
  def initialize
    super
    @number_of_wheels = 4
  end
end

class Bicycle < Motorless
  attr_reader :number_of_wheels, :number_of_gears

  def initialize(gears)
    super()
    @number_of_wheels = 2
    @number_of_gears = gears
  end

end

class Skateboard < Motorless
  attr_reader :number_of_wheels
  def initialize
    super
    @number_of_wheels = 2
  end
end

moto = Motorbike.new
car = Car.new
bike = Bicycle.new(8)
skateboard = Skateboard.new

vehicles = [moto, car, bike, skateboard]

vehicles.each do |vehicle|
  vehicle.age!
  puts "#{vehicle.what_am_i?} responds to:"
  puts "\tNumber of wheels: #{vehicle.respond_to?(:number_of_wheels) == true}"
  puts "\tColor: #{vehicle.respond_to?(:color) == true}"
  puts "\tAge!: #{vehicle.respond_to?(:age!) == true}"
  puts "\tHas motor: #{vehicle.respond_to?(:has_motor) == true}"
  puts "\tTank size: #{vehicle.respond_to?(:tank_size) == true}"
  puts "\tRefuel: #{vehicle.respond_to?(:refuel) == true}"
  puts "\tNumber of gears: #{vehicle.respond_to?(:number_of_gears) == true}"
  puts "\tAge: #{vehicle.age}"
  puts "\n\n"
end
