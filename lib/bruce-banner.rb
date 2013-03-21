require "bruce-banner/version"

module BruceBanner
  module ::Kernel
    def bb(what="", options={})
      options = {
        count:40,
        string:'-',
        before:true,
        after:true,
        size_to_fit:true
      }.merge(options)

      if options[:size_to_fit]
        options[:count] = what.to_s.size
      end

      puts(options[:string] * options[:count]) if options[:before]
      puts "#{what}"
      puts(options[:string] * options[:count]) if options[:after]
    end
  end
end
