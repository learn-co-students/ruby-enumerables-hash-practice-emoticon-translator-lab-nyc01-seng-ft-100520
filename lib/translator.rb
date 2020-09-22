#require modules here
require 'pry'
require "yaml"

def load_library(file_path)
  # code goes here
  hash = YAML.load_file(file_path)
  emoticons_hash = {}
  hash.each do |emoticon_name, inner_hash|
    emoticons_hash[emoticon_name]= {}
    emoticons_hash[emoticon_name][:english] = inner_hash[0]
    emoticons_hash[emoticon_name][:japanese] = inner_hash[1]
    end
    emoticons_hash
end

def get_japanese_emoticon(file_path, emoticon_name)
  # code goes here
  emoji = load_library(file_path)
  emoticon_name = emoji.keys.find do |key|
    emoji[key][:english] == emoticon_name
  end
  if emoticon_name
    emoji[emoticon_name][:japanese]
    else
      return "Sorry, that emoticon was not found"
    end
  end

def get_english_meaning(file_path, emoticon_name)
  emoji = load_library(file_path)
  emoticon_name = emoji.keys.find do |key|
    emoji[key][:japanese] == emoticon_name
  end
#  binding.pry
  if emoticon_name
    emoticon_name
  #  binding.pry
  else
    return "Sorry, that emoticon was not found"
  end
end
