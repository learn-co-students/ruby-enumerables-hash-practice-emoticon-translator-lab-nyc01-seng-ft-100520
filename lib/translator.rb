# require modules here
require 'yaml'
require 'pry'

def load_library(path)
  final_hash = {}
  YAML.load_file(path).each do |k, v|
    final_hash[k] = {}
    final_hash[k][:english] = v[0]
    final_hash[k][:japanese] = v[1]
  end
  final_hash 
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  load_library(path).each do |k,v |
    if v[:english] == emoticon
      return v[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
  
end

def get_english_meaning(path, emoticon)
  # code goes here
  load_library(path).each do |k,v |
    if v[:japanese] == emoticon
      return k
    end
  end
  return "Sorry, that emoticon was not found"
end