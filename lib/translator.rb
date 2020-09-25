require 'yaml'
require 'pry'
  
def load_library(file_path)
   final_hash = {}
    emoticons = YAML.load_file(file_path)
      emoticons.each do |name, both_emoticons|  
        final_hash[name] = {}
        final_hash[name][:english] = both_emoticons[0]
        final_hash[name][:japanese] = both_emoticons[1]
      end
    final_hash
end

   
    
def get_japanese_emoticon(file_path, emoticon)
    load_library(file_path).each do |key, value|
        if value[:english] == emoticon
            return value[:japanese]
        end
    end
    return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
    load_library(file_path).each do |key, value|
        if value[:japanese] == emoticon 
            return key
        end
    end
    return "Sorry, that emoticon was not found"
end