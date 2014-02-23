require 'lingua/stemmer'

class RequestHandler
  def initialize
    @stemmer= Lingua::Stemmer.new(:language => "de")

    @expert_histograms = {}
    @total = 0
    @all_histogram = Hash.new(0)
    Expert.all.each do |expert|
      expert_hist = Hash.new(0)
      expert.question_weights.each do |question_weight|
        #TODO: additionally use the weight of this question
        add_to_hist(question_weight.question.text, expert_hist)
        add_to_hist(question_weight.question.text, @all_histogram)
        @total += 1
      end
      @expert_histograms[expert.id] = expert_hist
    end
  end

  def find_expert_for(text)
    stems = to_stems(text) # assuming, every stem only exists once => 1/p is probability
    @expert_scores = Hash.new(0)
    return @expert_scores if text.blank?

    occurrences = stems.inject(Hash.new(0)) { |h, i| h[i] += 1; h }

    occurrences.each do |term, term_occ|
      @expert_histograms.each do |expert_id, expert_hist|
        score = expert_hist[term]*term_occ
        score *= Math.log(@total/@all_histogram[term].to_f) if @all_histogram[term] > 0
        @expert_scores[expert_id] += score
      end
    end
    @expert_scores.sort_by {|_, score| score}.reverse
  end

  private

  # Adds given text to a histogram of wordstems
  def add_to_hist(text, hist)
    to_stems(text).each do |stem|
      hist[stem] += 1
    end
  end

  # Turns a sentence into an array of word stems.
  def to_stems(sentence)
    return [] if sentence.blank?
    text = sentence.gsub /\s[A-Z][0-9][0-9]\..+\s/, '' # remove codes
    text.gsub!(/[\(\)\:\[\],\.\?]/, '') # remove special characters

    text.downcase!
    words = text.split(/[-\/\s]/) # split at whitespace/slash/line
    #words.reject! { |w| w.match(/[A-Z][0-9][0-9]\..+/) }
    words.reject! { |w| w.match(/[0-9]+/) } # reject digits
    words.map { |w| @stemmer.stem(w) }
  end
end