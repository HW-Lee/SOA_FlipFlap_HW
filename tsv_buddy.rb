# Module that can be included (mixin) to create and parse TSV data
module TsvBuddy
  # @data should be a data structure that stores information
  #  from TSV or Yaml files. For example, it could be an Array of Hashes.
  attr_accessor :data

  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    lines = tsv.split "\n"
    if lines.length > 0
      keys = lines[0].split "\t"
      values = lines[1..-1].map { |x| x.split "\t" }
      @data = values.map { |value| Hash[ keys.zip( value ) ] }
      self
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    keys = @data[0].keys
    values = @data.map { |x| x.values.reduce { |x, y| "#{x}\t#{y}" } }
    keys.join( "\t" ) + "\n" + values.join( "\n" ) + "\n"
  end
end
