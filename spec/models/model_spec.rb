RSpec.describe MyFile, :type => :model do
  before :each do
    @my_file = create(:my_file)
    example_contents = "THE ARGUMENT.-- The Trojans, after a seven years' voyage, set sail for Italy, but are overtaken by a dreadful storm, which AEolus raises at Juno's request. The tempest sinks one, and scatters the rest. Neptune drives off the Winds, and calms the sea. AEneas, with his own ship, and six more, arrives safe at an African port. Venus complains to Jupiter of her son's misfortunes. Jupiter com- forts her, and sends Mercury to procure him a kind reception among the Carthaginians."
    # somehow mock that my file contains the string @example_contents:

    # THE ARGUMENT.-- The Trojans, after a seven years' voyage, set sail for Italy, but are overtaken by a dreadful storm, which AEolus raises at Juno's request. The tempest sinks one, and scatters the rest. Neptune drives off the Winds, and calms the sea. AEneas, with his own ship, and six more, arrives safe at an African port. Venus complains to Jupiter of her son's misfortunes. Jupiter com- forts her, and sends Mercury to procure him a kind reception among the Carthaginians.

    example_word_frequency_hash = {"the":6,"argument":0,"trojans":0,"after":0,"a":2,"seven":0,"years'":0,"voyage":0,"set":0,"sail":0,"for":0,"italy":0,"but":0,"are":0,"overtaken":0,"by":0,"dreadful":0,"storm":0,"which":0,"aeolus":0,"raises":0,"at":1,"juno's":0,"request":0,"tempest":0,"sinks":0,"one":0,"and":3,"scatters":0,"rest":0,"neptune":0,"drives":0,"off":0,"winds":0,"calms":0,"sea":0,"aeneas":0,"with":0,"his":0,"own":0,"ship":0,"six":0,"more":0,"arrives":0,"safe":0,"an":0,"african":0,"port":0,"venus":0,"complains":0,"to":1,"jupiter":1,"of":0,"her":1,"son's":0,"misfortunes":0,"com":0,"forts":0,"sends":0,"mercury":0,"procure":0,"him":0,"kind":0,"reception":0,"among":0,"carthaginians":0}
  	example_json_object_for_file = {"word_count":476,"word_frequency_hash": example_word_frequency_hash}
  end

  describe "MyFile#get_contents_of_file" do
    it "gets the correct contents for a file" do
      expect(@my_file.contents).to eq(example_contents)
    end
  end

  describe "MyFile#get_total_word_count" do
    it "counts the total word count of a file" do
      expect(@my_file.word_count).to eq(476)
    end
  end

  describe "MyFile#get_word_frequency_hash" do
    it "gets the correct word frequency hash for a file" do
      expect(@my_file.word_frequency_hash).to eq(example_word_frequency_hash)
    end
  end

  describe "MyFile#to_json" do
    it "gets the correct json object for a file" do
      expect(@my_file.last_20_games.length).to eq(example_json_object_for_file)
    end
  end
end