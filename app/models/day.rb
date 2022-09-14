class Day < ActiveRecord::Base 
    has_many :tasks
    has_many :categories, through: :tasks

    validates :name, presence: true, uniqueness: true

end