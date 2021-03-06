require 'helper'
module UnionType
  extend Helper
# similar to Scala's `match` for case class
#
# will pattern match the value out and pass to matched lambda
# ```ruby
# Right.new(1).when({Right: ->x{x+1} }) # => 2
# Right.new(1).when({Left: ->x{x+1}) # => nil
# Right.new(1) =~ ({Left: ->x{x+1}, _: ->x{x-1} }) # => 0
# ```
# @return [Either]
  def when what
    current_class = self.class.to_s.to_sym
    if what.include? current_class
      what[current_class].(@v)
    elsif what.include? :_
      what[:_].(@v)
    end
  end

  alias_names [:match, :=~], :when
end
