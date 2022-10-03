module Exercise
  module Arrays
    class << self
      def replace(array)
        array.map! { |i| i.positive? ? array.max : i }
      end

      def search(_array, _query)
        max = array.length - 1
        min = 0
        while min <= max
          middle_elem = ((max - min) / 2) + min
          if query < array[middle_elem]
            max = middle_elem - 1
          elsif query > array[middle_elem]
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
