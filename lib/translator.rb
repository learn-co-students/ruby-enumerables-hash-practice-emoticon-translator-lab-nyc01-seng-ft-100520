# require modules here
require "yaml"

def load_library(location)
  # code goes here
  emojis = YAML.load_file(location)
  emoji = {}
  emojis.each do |name, key|
    emoji[name] = {:english => key[0], :japanese => key[1]}
  end
  emoji
end

def get_japanese_emoticon(location, emoticon)
  # code goes here
  all = load_library(location)
  output = ""
  
  all.each do |name, key|
    if emoticon == key[:english]
      output = key[:japanese]
    end
  end
  
  if output != ""
    return output
  else 
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(location, emoticon)
  # code goes here
  
  all = load_library(location)
  output = ""
  
  all.each do |name, key|
    if emoticon == key[:japanese]
      output = name
    end
  end
  
  if output != ""
    return output
  else 
    return "Sorry, that emoticon was not found"
  end
  
end