class Task < ActiveRecord::Base
    belongs_to :category
    belongs_to :day

    validates :name, presence: true, uniqueness: true
    validates :minutes, presence: true

end