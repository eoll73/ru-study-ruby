module Exercise
  module Fp
    class << self
      def rating(array)
        ratings_of_interest = array.reduce([]) do |acc, film|
          if has_rating?(film["rating_kinopoisk"].to_f) and multiple?(film["country"])
            acc << film['rating_kinopoisk'].to_f 
          end
          acc
        end

        ratings_of_interest.reduce(0.0, :+) / ratings_of_interest.length
      end

      def chars_count(films, threshold)
        films.filter { |film| film['rating_kinopoisk'].to_f.nil? || film['rating_kinopoisk'].to_f >= threshold }
             .map { |film| film['name'] }
             .reduce(0) { |acc, film| acc + film.count('и') }
      end

      private

      def multiple?(string)
        return false if string.nil?
        string.each_char do |char|
          return true if char == ','
        end
         return false
      end

      def has_rating?(value)
        value != 0.0
      end
    end
  end
end
# а как это работает? пушу в эту же  ветку , а на гит  хабе  ересь какая-то в ПР