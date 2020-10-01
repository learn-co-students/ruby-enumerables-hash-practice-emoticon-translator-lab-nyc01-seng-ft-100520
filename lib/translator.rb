# require modules here
require 'yaml'


def load_library(path)
  emoticons= YAML.load_file(path)
  emoticon_name= Hash.new

  emoticons.each do |emotion, array_faces|
    array_faces.each do |each_face|
      if emoticon_name[emotion]==NIL
        emoticon_name[emotion] = Hash.new
        emoticon_name[emotion][:english] = each_face
      else
        emoticon_name[emotion][:japanese] = each_face
      end
    end
  end
  emoticon_name
end


def get_japanese_emoticon (path, english_face)
  emoticon_name=load_library(path)
  translation="Sorry, that emoticon was not found"
  emoticon_name.each do |emotion, language|
    language.each do |language, face|
      if face==english_face
        translation= emoticon_name[emotion][:japanese]
      end
  end
end
 return translation 
end





def get_english_meaning (path, japanese_face)
  emoticon_name = load_library(path)
  meaning = ""
  emoticon_name.each do |emotion, language|
    language.each do |language, face|
      if face==japanese_face
        meaning = emotion
      end
    end
  end
 if meaning == ""
   return "Sorry, that emoticon was not found"
  else
    return meaning
  end
end