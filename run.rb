class Gematria

  def create_alphabet
    arr = ('a'..'z').to_a
    nums = (1..9).to_a
    count = 1; vals = {}
    arr.each { |i| vals[i] = count; count < 9 ? count += 1 : count = 1 }
    nums.each { |i| vals[i.to_s] = i }
    vals
  end

  def translate(input)
    temp = input
    input = input.strip.downcase.split('')
    alphabet = create_alphabet; translation = []
    vowels = ["a","e","i","o","u"]; vowel_sum = []; cons_sum = []
    input.each { |i| vowel_sum << alphabet[i] if vowels.include?(i) }
    input.each { |i| cons_sum << alphabet[i] if !vowels.include?(i) }
    input.each { |i| translation << (alphabet[i] || 0) }
    sequence = translation.join
    p "#{temp}:: Sequence: #{sequence} Sum #{translation.reduce(&:+)}"
    puts "Your numbers are: #{sum(vowel_sum.join + cons_sum.join, "Total")} #{sum(vowel_sum.join, "Vowels")} #{sum(cons_sum.join, "Consonants")}"
    
  end

  def sum(translation, desc)
    if translation == 11 || translation == 22 || translation == 33
      output(translation)
    else
      val = translation.to_s.split('')
      if val.length > 1
        val = val.reduce(&:+).each_char.map(&:to_i).reduce(&:+)
        sum val, desc
      else
        output(translation)
      end
    end
  end

  def output(translation)
    translation
  end
end

result = Gematria.new
p 'Input a string: '
input = gets.chomp
result.translate(input)
