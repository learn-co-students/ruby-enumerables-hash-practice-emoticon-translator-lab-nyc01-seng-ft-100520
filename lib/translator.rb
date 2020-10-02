require 'yaml'
require 'pry'


def load_library(path)
emoticons = YAML.load_file(path)
emoticons_hash = {}

emoticons.map do |meaning, emoticon_set|
  emoticons_hash[meaning] = {}
  emoticons_hash[meaning][:japanese]= emoticon_set.last
  emoticons_hash[meaning][:english] = emoticon_set.first
end
  emoticons_hash
end


def get_japanese_emoticon(path, emoticon)
   load_library(path).each do |key, value|
     if value[:english] == emoticon
       return value[:japanese]
    end
end
return "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  load_library(path).each do |key, value|
      if value[:japanese] == emoticon
      return key
      end
  end
  return "Sorry, that emoticon was not found"
end

