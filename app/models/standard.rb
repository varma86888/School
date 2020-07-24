class Standard < ApplicationRecord
    belongs_to :school
    has_many :students
    has_many :branches, through: :students
    has_many :teachers
end
