# require modules here
require 'yaml'
require 'pry'

def load_library(file_to_load)
  new_hash = {}
  YAML.load_file(file_to_load).each do |key, value|
    if !new_hash[key]
      new_hash[key] = {:english => value[0], :japanese => value[1]}
    end
  end
  new_hash
end

def get_japanese_emoticon(file_to_load, emoticon)
  hash = load_library(file_to_load)
  #binding.pry 
  variable = nil 
  hash.each do |emoji, language|
    if language[:english] == emoticon
      variable = language[:japanese]
    end
  end
  if variable == nil
    return "Sorry, that emoticon was not found"
  else
    return variable
  end
end

def get_english_meaning(file_to_load, emoticon)
  hash = load_library(file_to_load)
  variable = nil 
  hash.each do |emoji, language|
    if language[:japanese] == emoticon
      variable = emoji
    end
  end
  if variable == nil
    return "Sorry, that emoticon was not found"
  else
    return variable
  end
end