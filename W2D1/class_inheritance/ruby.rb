require 'byebug'

class Employee
    attr_reader :title, :salary
    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
        boss.add_employee(self) unless boss.nil?
    end

    def bonus(multiplier)
        res = 0
        if title == "manager"
            self.employees.each do |employee|
                res += employee.salary
            end
            res = res * multiplier
        else
            res = salary * multiplier
        end
        return res
    end

    def inspect
        "#{self.object_id}"
    end
end

class Manager < Employee
    attr_reader :employees

    def initialize(name, title, salary, boss)
        super
        @employees = []
    end

    def add_employee(person)
        employees << person
    end

end

if __FILE__ == $PROGRAM_NAME
    kyle = Manager.new("Kyle","manager", 12, nil)
    ned = Employee.new("Ned", "TA", 10, kyle)
    ted = Employee.new("Ted", "TA", 10, kyle)
    ned.bonus(2)
end
