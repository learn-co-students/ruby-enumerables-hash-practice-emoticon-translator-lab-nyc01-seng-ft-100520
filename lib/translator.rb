# require modules here
require "yaml"
require "pry"

def load_library(file)
  emoti_hash = {}
  
  emoticons = YAML.load_file(file)
  emoticons.map do |key, value|
    emoti_hash[key] = {
      :english => value[0],
      :japanese => value[1]
    }
  end
  emoti_hash
end

def get_japanese_emoticon(file, emoticon)
  library = load_library(file)

 current_emoti = library.find do |key, value| 
      library[key][:english] == emoticon
  end
  if current_emoti == NIL
    return "Sorry, that emoticon was not found"
  end
  current_emoti[1][:japanese]
end

def get_english_meaning(file, emoticon)
 library = load_library(file)

 current_emoti = library.find do |key, value| 
      library[key][:japanese] == emoticon
  end
  if current_emoti == NIL
    return "Sorry, that emoticon was not found"
  end
  # binding.pry
  current_emoti[0]
end