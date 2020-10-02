# require modules here
require "yaml"



def load_library(file_path)
  # code goes here
  hash = YAML.load_file(file_path)
  
  result = Hash.new
  
  hash.each_pair do |key, value|
    result[key] = {
      english: value[0],
      japanese: value [1]
    }
  end
  result
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  load_library(path).each_pair do |k, v|
    if v[:english] == emoticon
      return v[:japanese]
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(path,emoticon)
  # code goes here
   load_library(path).each_pair do |k, v|
    if v[:japanese] == emoticon
      return k
    end
  end
  "Sorry, that emoticon was not found"
end
