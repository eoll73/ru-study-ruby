module Exercise
  module Fp
    class << self
      def rating(array)
        ratings_of_interest = array.each_with_object([]) do |film, acc|
          acc << film['rating_kinopoisk'].to_f if rating?(film['rating_kinopoisk'].to_f) && multiple?(film['country'])
        end

        ratings_of_interest.reduce(0, :+) / ratings_of_interest.length
      end

      def chars_count(films, threshold)
        result = films.map do |film|
          film['name'].chars.select { |char| char == 'и' }.length if !film['rating_kinopoisk'].nil? && film['rating_kinopoisk'].to_f >= threshold
        end.compact
        result.reduce(:+)
      end

      private

      def multiple?(string)
        return false if string.nil?

        string.each_char { |char| return true if char == ',' }
        false
      end

      def rating?(value)
        value != 0
      end
    end
  end
end
