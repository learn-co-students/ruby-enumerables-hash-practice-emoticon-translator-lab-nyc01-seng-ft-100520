require 'pry'
require 'yaml'

def load_library(file_location)
  dictionary = YAML.load_file(file_location)
  
  ej_dictionary = dictionary.each_with_object({}) do |(emotion, emoji), new_dictionary|
    if !new_dictionary[emotion]
      new_dictionary[emotion] = {:english => emoji[0], :japanese => emoji[1]}
    end
  end
  
  ej_dictionary
end


def get_japanese_emoticon(file_location, english_emoticon)
  dictionary = load_library(file_location)
  japanese_emoticon = nil 
  
  dictionary.each do |emotion, value|
    value.each do |language, inner_value|
      if english_emoticon == inner_value
        japanese_emoticon = dictionary[emotion][:japanese]
      end
    end
  end
  
  if japanese_emoticon == nil
    "Sorry, that emoticon was not found"
  else
    japanese_emoticon
  end
end


def get_english_meaning(file_location, japanese_emoticon)
  dictionary = load_library(file_location)
  english_meaning = nil 
  
  dictionary.each do |emotion, value|
    value.each do |language, inner_value|
      if japanese_emoticon == inner_value
        english_meaning = emotion
      end
    end
  end
  
  if english_meaning == nil
    "Sorry, that emoticon was not found"
  else
    english_meaning
  end
end

