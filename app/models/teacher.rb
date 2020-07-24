class Teacher < ApplicationRecord
    belongs_to :school, optional: true
    belongs_to :branch, optional: true
    belongs_to :standard, optional: true
    has_and_belongs_to_many :students, optional: true
end
