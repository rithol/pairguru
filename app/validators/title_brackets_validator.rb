class TitleBracketsValidator < ActiveModel::Validator
  BRACKETS = %w(( ) { } [ ]).freeze
  EMPTY_BRACKETS = %w(() {} []).freeze

  def validate(record)
    record.errors.add(:title, "has invalid brackets") if !valid_brackets?(record.title)
  end

  private

  def valid_brackets?(title)
    return true unless BRACKETS.any? { |bracket| title.include?(bracket) }
    return false if EMPTY_BRACKETS.any? { |bracket| title.include?(bracket) }
    index = 0
    title.count("(").downto(1).each do |i|
    	index = title.index("(", index)
    	return false if title.slice(index..-1).count(")") < i
    	index += 1
    end
    index = title.length
    title.count(")").downto(1).each do |i|
    	index = title.rindex(")", index)
    	return false if title.slice(0..index).count("(") < i
    	index -= 1
    end
    index = 0
    title.count("{").downto(1).each do |i|
    	index = title.index("{", index)
    	return false if title.slice(index..-1).count("}") < i
    	index += 1
    end
    index = title.length
    title.count("}").downto(1).each do |i|
    	index = title.rindex("}", index)
    	return false if title.slice(0..index).count("{") < i
    	index -= 1
    end
    index = 0
    title.count("[").downto(1).each do |i|
    	index = title.index("[", index)
    	return false if title.slice(index..-1).count("]") < i
    	index += 1
    end
    index = title.length
    title.count("]").downto(1).each do |i|
    	index = title.rindex("]", index)
    	return false if title.slice(0..index).count("[") < i
    	index -= 1
    end
    return true
  end
end