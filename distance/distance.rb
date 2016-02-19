module DataHelper
  class Distance

    def Distance.euclidean (vector_a, vector_b)
      sum = 0
      vector_a.each_with_index { |data_point, index|
        difference = data_point - vector_b[index]
        sum = sum + difference**2
      }
      Math.sqrt(sum)
    end

    def Distance.manhattan (vector_a, vector_b)
      sum = 0
      vector_a.each_with_index { |data_point, index|
        difference = (data_point - vector_b[index]).abs
        sum += difference
      }
      sum
    end

    def Distance.chebyshev (vector_a, vector_b)
      result = 0
      vector_a.each_with_index { |data_point, index|
        difference = (data_point - vector_b[index]).abs
        result = [result, difference].max
      }
      result
    end

  end
end
