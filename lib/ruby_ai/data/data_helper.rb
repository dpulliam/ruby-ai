module DataHelper
  module  Normalization

    class Qualitative
      class << self

        def normalize_ordinal (data_set, upper_bound, lower_bound)
          num_data_points = data_set.length
          normalized_data = Array.new
          data_set.each_with_index do |data, index|
            normalized_data[index] = (((upper_bound.to_f - lower_bound.to_f) * (index + 1).to_f) / num_data_points.to_f) + lower_bound.to_f
          end
          return normalized_data
        end

        def denormalize_ordinal(data_set, upper_bound, lower_bound)
          num_data_points = data_set.length
          normalized_data = Array.new

          data_set.each_with_index do |data, index|
            normalized_data[index] = ((num_data_points.to_f * (data.to_f - lower_bound.to_f ))/(upper_bound.to_f - lower_bound.to_f)) - 1
          end
          return normalized_data
        end

        def noralize_nominal(data_set, upper_bound, lower_bound)
          self.one_of_n(data_set, upper_bound, lower_bound)
        end

        def denormalize_nominal
        end

        def self.one_of_n(data_set, upper_bound, lower_bound)
          num_data_points = data_set.length
          normalized_data = Hash.new
          data_set.each_with_index do |data, index|
            tmp = Array.new(num_data_points, lower_bound)
            tmp[index] = upper_bound
            normalized_data[data.to_sym] = tmp
          end
          return normalized_data
        end
      end
    end

    class Quantitative
      class << self
        def normalize_ratio
          self.normalize_quantitative()
        end

        def normalize_interval
          self.normalize_quantitative()
        end
      end
    end

  end
end

