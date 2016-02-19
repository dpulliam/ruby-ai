module DataHelper
  class Distance
    class << self
      def euclidean (vector_a, vector_b)
        sum = 0
        vector_a.each_with_index { |data_point, index|
          difference = data_point - vector_b[index]
          sum = sum + difference**2
        }
        Math.sqrt(sum)
      end

      def manhattan (vector_a, vector_b)
        sum = 0
        vector_a.each_with_index { |data_point, index|
          difference = (data_point - vector_b[index]).abs
          sum += difference
        }
        sum
      end

      def chebyshev (vector_a, vector_b)
        result = 0
        vector_a.each_with_index { |data_point, index|
          difference = (data_point - vector_b[index]).abs
          result = [result, difference].max
        }
        result
      end

      def hamming (vector_a, vector_b)
        result = []
        vector_a.zip(vector_b){|a, b| result << (a ^ b)}
        result.reduce(:+)
      end

      def jaccard
        #TODO
      end

      def minkowski
        #TODO
      end

      def hahalanobis
        #TODO
      end

      def cosine_similarity
        #TODO
      end

      def pearson_correlation
        #TODO
      end

    end

  end
end
