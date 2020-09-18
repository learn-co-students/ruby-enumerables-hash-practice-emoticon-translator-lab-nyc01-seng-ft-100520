# require modules here
require "yaml"
require 'pry'

def load_library(yml)
  flex = YAML.load_file(yml) 

  flex.each_with_object({}) do |(key, value), i|
  i[key] = {:english => value[0],:japanese => value[1]}
  i
  end
end

def get_japanese_emoticon(yml,emo)
  flex = load_library(yml)
  
  flex.each do |key,value|
    if value[:english] == emo 
      return value[:japanese]
  end
end
return "Sorry, that emoticon was not found"
end

# get_japanese_emoticon("./lib/emoticons.yml", "ヽ(ｏ`皿′ｏ)ﾉ")

 def get_english_meaning(yml,emo)
  flex = load_library(yml)
  flex.each do |key,value|
    if value[:japanese] == emo
     return  key
    end
 end
  return "Sorry, that emoticon was not found"
end
 get_english_meaning("./lib/emoticons.yml", "(＾ｖ＾)")