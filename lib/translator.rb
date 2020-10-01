# require modules here
require "yaml"

def load_library(file_path)
  emoji = YAML.load_file(file_path)
  new_hash = {}

  emoji.each do |key,value|
    new_hash[key] = {}
    new_hash[key][:english] = value[0]
    new_hash[key][:japanese] = value[1]
  end

  new_hash
end

def get_japanese_emoticon(file_path, emoji)
  library = load_library(file_path)
  emoji = library.keys.find do |key|
    library[key][:english] == emoji
  end
  emoji ? library[emoji][:japanese] : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoji)
  library = load_library(file_path)
  emoji = library.keys.find do |key|
    library[key][:japanese] == emoji
  end
  emoji ? emoji : "Sorry, that emoticon was not found"
end 