module Exercise
  module Arrays
    class << self
      def replace(array)
        max = 0

        array.each { |element|
            max = element if element > max
        }
        (0..array.length - 1).each do |index|
          array[index] = max if array[index] > 0
        end
        array
      end

      def search(_array, _query)
        max = _array.length - 1
        min = 0
        while min <= max
          middle_elem = ((max - min) / 2) + min
          if _query < _array[middle_elem]
            max = middle_elem - 1
          elsif _query > _array[middle_elem]
            min = middle_elem + 1
          else
            return middle_elem
          end
        end
        -1
      end
    end
  end
end
