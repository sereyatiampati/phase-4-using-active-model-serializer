class Movie < ApplicationRecord

    def summary
        "#{title}: #{description}"
    end
end
