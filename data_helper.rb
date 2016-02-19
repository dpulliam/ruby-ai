module DataHelper

  def DataHelper.normalize_ordinal (data_set, upper_bound, lower_bound)
    num_data_points = data_set.length
    normalized_data = Array.new
    data_set.each_with_index do |data, index|
      normalized_data[index] = (((upper_bound.to_f - lower_bound.to_f) * (index + 1).to_f) / num_data_points.to_f) + lower_bound.to_f
    end
    return normalized_data
  end

  def DataHelper.normalize_nominal (data_set, upper_bound, lower_bound)
    num_data_points = data_set.length
    normalized_data = Hash.new
    data_set.each_with_index do |data, index|
      tmp = Array.new(num_data_points, lower_bound)
      tmp[index] = upper_bound
      normalized_data[data.to_sym] = tmp
    end
    return normalized_data
  end


  def DataHelper.denormalize_ordinal

  end

  def DataHelper.denormalize_nominal

  end

end

