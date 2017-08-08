class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary.to_i
    @boss = boss
    @boss.add_employee(self) unless @boss.nil?
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee
  attr_reader :employees

  def initialize(name, title, salary, boss, employees = [])
    @employees = employees
    super(name, title, salary, boss)
  end

  def add_employee(employee)
    @employees << employee
  end

  def bonus(multiplier)
    bonus = 0 # instantiate

    @employees.each do |el|
      unless el.employees.empty?
        el.employees.each do |emp|
          bonus += emp.salary
        end
      end
      bonus += el.salary #add employee salaries to bonus var
    end

    bonus * multiplier # multiply all salaries by multiplier
  end
end
