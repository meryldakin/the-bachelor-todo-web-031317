def get_first_name_of_season_winner(data, season)
  data[season].each do |contestant_profile|
    if contestant_profile["status"] == "Winner"
      first_name = contestant_profile["name"].split(" ")
      return first_name[0]
    end
  end
end



def get_contestant_name(data, occupation)
  data.keys.each do |season|
    data[season].each do |contestant|
      if contestant["occupation"] == occupation
        return contestant["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  hometown_counter = 0
  data.keys.each do |season|
    data[season].each do |contestant|
      if contestant["hometown"] == hometown
        hometown_counter += 1
      end
    end
  end
  return hometown_counter
end

def get_occupation(data, hometown)
  data.keys.each do |season|
    data[season].each do |contestant|
      if contestant["hometown"] == hometown
        return contestant["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  age_array = []
  data[season].each do |contestant|
    age_array.push(contestant["age"].to_f)
  end
  sum = age_array.inject(0) do |sum, x|
    sum + x
  end
  avg_age = (sum/age_array.length)
  return avg_age.round
end
