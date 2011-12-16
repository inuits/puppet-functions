module Puppet::Parser::Functions
  newfunction(:str_capitalize, :type => :rvalue, :doc => <<-EODOC
Returns the capitalized value of a string.

Prototype:

  str_capitalize(x)

If an array is specified, all elements of the array will modified.
(Unless they are not strings!)

  EODOC
  ) do |args|

    Puppet::Parser::Functions.autoloader.loadall
    args = [args] unless args.is_a?(Array)
    arguments = args.shift

    if arguments.is_a?(Array)
      new_array = []
      arguments.each do |argument|
        if argument.is_a?(String)
          new_array += argument.capitalize
        else
          new_array += argument
        end
      end
      ## return new array.
      new_array
    elsif arguments.is_a?(String)
      arguments.capitalize
    else
      arguments
    end
  end
end
