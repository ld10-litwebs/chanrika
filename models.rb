ActiveRecord::Base.establish_connection(ENV['DATABASE_URL']||"sqlite3:db/development.db")

class Lesson < ActiveRecord::Base
    belongs_to :field
end

class Field < ActiveRecord::Base
    has_many :lessons
end
