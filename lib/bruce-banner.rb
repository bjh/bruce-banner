require "bruce-banner/version"

module BruceBanner

  def self.make_him_angry!
    # ASCII art from http://www.oocities.org/joan_stark/hulk.txt
    output = []
    output << "                 ,#####,                "
    output << "                 #_   _#                "
    output << "                 |e` `e|                "
    output << "                 |  u  |                "
    output << "                 \\  =  /                "
    output << "                 |\\___/|                "
    output << "        ___ ____/:     :\\____ ___       "
    output << "      .'   `.-===-\\   /-===-.`   '.     "
    output << '     /      .-"""""-.-"""""-.      \    '
    output << "    /'             =:=             '\\   "
    output << "  .'  ' .:    o   -=:=-   o    :. '  `. "
    output << "  (.'   /'. '-.....-'-.....-' .'\\   '.) "
    output << "  /' ._/   \".       :       .\"   \\_. '\\ "
    output << " |  .'|      \".  ---:---  .\"     |'.  | "
    output << " |  : |       |  ---:---  |      | :  | "
    output << "  \\ : |       |_____:_____|      | : /  "
    output << "  /   (       |----|------|      )   \\  "
    output << " /... .|      /`   |     '\\     |. ...\\  "
    output << "|::::/''     /    .L__.    \\    ''\\::::| "
    output << " \"\"\"\"       /      / \\       \\     \"\"\"\"  "
    output << "           :      /   \\      :          "
    output << "           |     /     \\     |          "
    output << "           \\    /       \\    /          "
    output << "            )  |         |  (           "
    output << "           /   |         |   \\          "
    output << "          (/\\/\\|         |/\\/\\)         "
    output << "           \\  |           |  /          "
    output << "            ) |           | (           "
    output << "       _.-'`   \\         /   `'-._      "
    output << "      :________/         \\________;     "
    output << ""
    output << "ASCII art from http://www.oocities.org/joan_stark/hulk.txt"

    puts output.join "\n"
  end

  module Configuration
    attr_accessor :defaults
  end


  # this is where the magic happens...
  module ::Kernel
    # block magic shamelessly stolen from Jim Weirich (with a small tweak)
    # http://www.justskins.com/forums/print-out-a-variables-101209.html
    def bb(what="", options={}, &block)
      options = BruceBanner.defaults.merge(options)

      if block_given?
        name = block.call.to_s
        what = "#{name}: #{eval(name, block.binding)}"
      end

      if options[:size_to_fit]
        options[:count] = [what.to_s.size, BruceBanner.defaults[:maximum]].min
      end

      puts(options[:string] * options[:count]) if options[:before]
      puts "#{what}"
      puts(options[:string] * options[:count]) if options[:after]
    end


    # def debug(&block)
    #   name = block.call.to_s
    #   bb "#{name} = #{eval(name, block.binding)}"
    # end
  end

  # configure-ater-iter-voodoo
  def self.configuration
    yield(self.defaults) if block_given?
  end

  extend Configuration

  # Hulk SMASH!
  attr_accessor :defaults

  self.defaults = {
    count:40,
    string:'-',
    before:true,
    after:false,
    size_to_fit:true,
    maximum: 80
  }
end
