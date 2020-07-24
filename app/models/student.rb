class Student < ApplicationRecord
    belongs_to :school, optional: true
    belongs_to :branch, optional: true
    belongs_to :standard, optional: true
    has_and_belongs_to_many :teachers, optional: true

    before_save :age 

    def age
        self.age = (Date.today.strftime("%Y").to_i - dob.strftime("%Y").to_i)
    end

end
