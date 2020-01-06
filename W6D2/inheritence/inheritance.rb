class Employee
    attr_reader :name, :salary, :title, :boss

    def initialize(name, salary, title, boss)
        @name = name
        @salary = salary
        @title = title
        @boss = boss
    end 

    def bonus(multiplier)
       bonus = (self.salary) * multiplier 
    end 

end 

class Manager < Employee

    attr_reader :employees

    def initialize(name, salary, title, boss)
        super
    end 

    def employees=(employees = [])
        @employees = employees
    end 

    def bonus(multiplier)
        salaries = employees.map { |employee| employee.salary }
       bonus = (salaries.sum) * multiplier 
    end 
end 

ned = Manager.new("Ned", 1000000, "founder", nil )
darren = Manager.new("Darren", 78000, "TA Manager", ned)
shawna = Employee.new("Shawna", 12000, "TA", darren)
david = Employee.new("David", 10000, "TA", darren)
ned.employees = [darren, shawna, david]
darren.employees = [shawna, david]

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000