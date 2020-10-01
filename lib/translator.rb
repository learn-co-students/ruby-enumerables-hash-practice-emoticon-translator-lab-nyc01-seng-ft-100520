require "pry"
require "yaml"

def load_library(file)
  emoticons_hash = YAML.load_file(file)
  ruby_hash = Hash.new
  
  emoticons_hash.each do |name, emojis|
    ruby_hash[name] = {:english => emojis[0], :japanese => emojis[1]}
  end
  ruby_hash
end

def get_japanese_emoticon(file, english_emoji)
  dictionary = load_library(file)
  translated = dictionary.find {|name, translations| translations[:english] == english_emoji}
  # translated is an array like ["sad", { :english => ":'(", :japanese => "(Ｔ▽Ｔ)" }]
  if translated
    translated[1][:japanese]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, japanese_emoji)
  dictionary = load_library(file)
  translated = dictionary.find {|name, translations| translations[:japanese] == japanese_emoji}
  if translated
    translated[0] if translated
  else
    "Sorry, that emoticon was not found"
  end
end

#pp get_english_meaning("./lib/emoticons.yml", "(＾ｖ＾)")
