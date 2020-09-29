# require modules here
require 'pry'
require 'yaml'
def load_library(emoticons)
emoticons_hash = YAML.load_file(emoticons)
new_hash = {}
 emoticons_hash.each do |key, value|
 new_hash[key] = {:english => value[0], :japanese => value[1]}
  end
  new_hash
end

def get_japanese_emoticon(emoticons, english_emoticon)
  # code goes here
  #emoticons_hash = YAML.load_file(emoticons)
  sorry_message = "Sorry, that emoticon was not found"
  emoticons_hash = load_library(emoticons)
  emoticons_hash.find do |name, hash|
#binding.pry
    if hash[:english] == english_emoticon
      return hash[:japanese]
    end
  end
  sorry_message
end

def get_english_meaning(emoticons, japanese_emoticon)
  # code goes here
  sorry_message = "Sorry, that emoticon was not found"
  emoticons_hash = load_library(emoticons)
  emoticons_hash.find do |name, hash|
    #binding.pry
    if hash[:japanese] == japanese_emoticon
     return name
    end
    #sorry_message
  end
  sorry_message
end
