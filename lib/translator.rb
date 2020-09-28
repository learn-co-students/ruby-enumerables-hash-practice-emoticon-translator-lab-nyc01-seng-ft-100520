# require modules here
require "pry"
require "yaml"


def load_library(cats)
  # code goes here
emoticons = YAML.load_file(cats)

empty_hash = {}

  emoticons.each do |key, value|
    empty_hash[key] = {}
      empty_hash[key][:english] = value[0]
      empty_hash[key][:japanese] = value[1]
    end
empty_hash
end

def get_japanese_emoticon(emoticons, english_emoji)
  # code goes here
  hash = load_library(emoticons)

    hash.each do |key, value|
      if value[:english] == english_emoji
        # value.each do |inner_key, inner_value|
        return value[:japanese]
      end

    end
    return "Sorry, that emoticon was not found"
end
#
def get_english_meaning(emoticons, japanese_emoji)
  # code goes here
  hash = load_library(emoticons)

  hash.each do |key, value|
  if value[:japanese] == japanese_emoji
    return key
    end
  end
  return "Sorry, that emoticon was not found"
end
