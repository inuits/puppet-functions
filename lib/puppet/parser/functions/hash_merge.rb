module Puppet::Parser::Functions
  newfunction(:hash_merge, :type => :rvalue, :doc => <<-EODOC

@todo: Document function.

  EODOC
  ) do |args|

    Puppet::Parser::Functions.autoloader.loadall
    args = [args] unless args.is_a?(Array)
    orig_hash = args.shift
    merge_hash = args.shift

    target = orig_hash.dup

    merge_hash.keys.each do |key|
      if merge_hash[key].is_a?(Hash) and orig_hash[key].is_a?(Hash)
        target[key] = function_hash_merge(target[key], hash[key])
        next
      end
      target[key] = hash[key]
    end


    if orig_hash.is_a?(Hash) && merge_hash.is_a?(Hash)
      orig_hash.merge(merge_hash)
    else
      raise Puppet::ParseError, "hash_merge(): Unexpected argument type."
    end
  end
end

