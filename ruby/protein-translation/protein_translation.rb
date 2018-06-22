class Translation
    def self.of_codon(codon)
    protein = case codon
    when "AUG" then "Methionine"
    when "UUU, UUC" then "Phenylalanine"
    when "UUU" then "Phenylalanine"
    when "UUC" then "Phenylalanine"
    when "UUA, UUG" then "Leucine"
    when "UCU, UCC, UCA, UCG" then Serine
    when "UAU, UAC" then " Tyrosine"
    when "UGU, UGC" then "Cysteine"
    when "UGG" then "Tryptophan"
    when "UAA, UAG, UGA" then "STOP"
    else nil
    end
  end
end

puts Translation.of_codon("AUG")