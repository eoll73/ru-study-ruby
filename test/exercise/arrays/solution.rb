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

      def search(array, query, first = 0, last = array.size - 1)
        interval = last - first
        middle = (last + first) / 2
        return last if array[last] == query
        return first if array[first] == query
        return middle if array[middle] == query
        
        if interval > 1
          return array[middle] < query ? self.search(array, query, middle, last) 
          : self.search(array, query, first, middle) 
        end
        return -1
      end
    end
  end
end
