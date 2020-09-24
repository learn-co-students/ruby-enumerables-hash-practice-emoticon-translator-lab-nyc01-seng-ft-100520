require "yaml"
require "pry"

def load_library(file_path)
  imported_lib = YAML.load_file(file_path)
  final_lib = imported_lib.each_with_object({}) do |(outer_key, outer_value), new_lib|
    new_lib[outer_key] = {}
    new_lib[outer_key][:english] = outer_value[0]
    new_lib[outer_key][:japanese] = outer_value[1]
  end
  final_lib
end

def get_japanese_emoticon(file_path, emoticon)
  translated_lib = load_library(file_path)
  translated_lib.each do |outer_key, outer_value|
    if outer_value.value?(emoticon)
      return outer_value[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  translated_lib = load_library(file_path)
  translated_lib.each do |outer_key, outer_value|
    if outer_value.value?(emoticon)
      return outer_key
    end
  end
  return "Sorry, that emoticon was not found"
end