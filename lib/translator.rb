require "yaml"
# require modules here

def load_library (emoticon_hash)
   emoticons = YAML.load_file(emoticon_hash)

   emoticon_hash  = {}
   emoticons.each do |key,value|
   emoticon_hash [key] = 
     {"english".to_sym => value[0],
     "japanese".to_sym => value[1]}
  end

  emoticon_hash
end
  

def get_japanese_emoticon (emoticon_hash, emoticon)
   # code goes here
    emoticon_hash = load_library(emoticon_hash)
    emoticon_hash.each do |key,value|
    if value[:english] == emoticon 
       return value[:japanese]
    end
  end
  "Sorry, that emoticon was not found"
end 
 

def get_english_meaning(emoticon_hash,emoticon)
  # code goes here
    emoticon_hash = load_library(emoticon_hash)
    emoticon_hash.each do |key,value|
    if value[:japanese] == emoticon 
       return key
    end
  end
   "Sorry, that emoticon was not found"
end
