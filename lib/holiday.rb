require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
 holiday_hash.each do |season, holiday|
   if season == :winter 
    holiday.each do |holiday, array|
      array.push(supply)
    end
  end
end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
 holiday_hash.each do |season, holiday|
   if season == :spring 
    holiday.each do |holiday, array|
       array.push(supply)
    end
  end
end 
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  nested_array = holiday_hash[:winter].values
  array = nested_array.flatten
  array
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holiday|
    string = season.to_s 
    string.capitalize!
    puts "#{string}:" 
    
    holiday.each do |holiday, supply|
      string = holiday.to_s
      array = string.split("_",)
      array.each do |element|
        element.capitalize!
      end
      finalarray = array.join(" ")
    
      party_hat = supply.join
      partyhat = party_hat.split(" ")
      partyhat.each do |element|
        element.capitalize!
      end
      string2 = supply.join(", ")
      
      puts "  #{finalarray}: #{string2}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  array = []
  holiday_hash.each do |season, holiday|
    holiday.each do |key, value|
      value.each do |element|
        if element == "BBQ"
          array.push(key)
        end
      end
    end
  end
  array
end