describe "#load_library" do
let(:emoticons) { ['angel', 'angry', 'bored', 'confused', 'embarrassed', 'fish', 'glasses', 'grinning', 'happy', 'kiss', 'sad', 'surprised', 'wink'] }
let(:emoticon_symbols) { [:angel, :angry, :bored, :confused, :embarrassed, :fish, :glasses, :grinning, :happy, :kiss, :sad, :surprised, :wink] }

  it "accepts one argument, the file path" do
    expect { load_library("./lib/emoticons.yml") }.to_not raise_error
  end

  context "return value" do

    let(:result) { load_library("./lib/emoticons.yml") }

    it "returns a hash" do
      expect(result.class).to eq(Hash)
    end


    it "each key points to an inner hash" do
      result.keys.each { |key| expect(result[key].class).to eq(Hash) }
    end

  end

end

describe "#get_english_meaning" do

  it "accepts two arguments, the YAML file path and the emoticon" do
    expect { get_english_meaning("./lib/emoticons.yml", "(Ｔ▽Ｔ)") }.to_not raise_error
  end

  it "calls on #load_library and gives it the argument of the file path" do
    emoticon_hash = load_library("./lib/emoticons.yml")

    file_path = "./lib/emoticons.yml"
    expect(self).to receive(:load_library).with(file_path).and_return(emoticon_hash)
    answer = get_english_meaning("./lib/emoticons.yml", "=D")
  end

  it "returns the English meaning of the Japanese emoticon (＾ｖ＾)" do
    expect(get_english_meaning("./lib/emoticons.yml", "(＾ｖ＾)")).to eq("happy")
  end

  it "returns the English meaning of the Japanese emoticon (￣ー￣)" do
    expect(get_english_meaning("./lib/emoticons.yml", "(￣ー￣)")).to eq("grinning")
  end

  it "returns the English meaning of the Japanese emoticon (Ｔ▽Ｔ)" do
    expect(get_english_meaning("./lib/emoticons.yml", "(Ｔ▽Ｔ)")).to eq("sad")
  end

  it "returns an apology message if the argument is not a known emoticon" do
    sorry_message = "Sorry, that emoticon was not found"
    expect(get_english_meaning("./lib/emoticons.yml", "$#$%{}*")).to eq(sorry_message)
  end

end

describe "#get_japanese_emoticon" do

  it "accepts two arguments, the YAML file path and the emoticon" do
    expect { get_japanese_emoticon("./lib/emoticons.yml", ":)") }.to_not raise_error
  end

  it "calls on #load_library and gives it the argument of the file path" do
    emoticon_hash = load_library("./lib/emoticons.yml")

    file_path = "./lib/emoticons.yml"
    expect(self).to receive(:load_library).with(file_path).and_return(emoticon_hash).at_least(:once)
    answer = get_japanese_emoticon("./lib/emoticons.yml", "=D")
  end

  it "returns the Japanese equivalent of an English grinning" do
    expect(get_japanese_emoticon("./lib/emoticons.yml", "=D")).to eq("(￣ー￣)")
  end

  it "returns the Japanese equivalent of an English happy" do
    expect(get_japanese_emoticon("./lib/emoticons.yml", ":)")).to eq("(＾ｖ＾)")
  end

  it "returns the Japanese equivalent of an English sad" do
    expect(get_japanese_emoticon("./lib/emoticons.yml", ":'(")).to eq("(Ｔ▽Ｔ)")
  end

  it "returns an apology message if the argument is not a known emoticon" do
    sorry_message = "Sorry, that emoticon was not found"
    expect(get_japanese_emoticon("./lib/emoticons.yml", "$#$%{}*")).to eq(sorry_message)
  end

end


