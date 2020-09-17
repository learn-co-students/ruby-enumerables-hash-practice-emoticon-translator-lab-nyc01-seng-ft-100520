# require modules here
require 'pry'
require "yaml"
emoticons = YAML.load_file("./lib/emoticons.yml")

 def load_library(file)
   emoticons = YAML.load_file("./lib/emoticons.yml")
  emoticons.each_with_object({}) do |(key, value), emoticons_final_hash|
    emoticons_final_hash[key] = {}
      emoticons_final_hash[key][:english] = value[0]
      emoticons_final_hash[key][:japanese] = value[1]
  end
end

def get_japanese_emoticon(file, string)
  emoticons = load_library(file)
  emoticons.each do |key, value|
      if value[:english] == string
        return value[:japanese]
      end
      end
      return "Sorry, that emoticon was not found"
  end



def get_english_meaning(file, string)
  emoticons = load_library(file)
  emoticons.each do |key, value|
    if value[:japanese] == string
      return key
    end
  end
  return "Sorry, that emoticon was not found"
end