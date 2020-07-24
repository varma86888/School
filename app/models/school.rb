class School < ApplicationRecord
    has_many :branches
    has_many :standards
    has_many :students
    has_many :teachers
    # validates :name, presence: true, uniqueness: true
end
