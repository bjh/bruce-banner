bruce-banner
# BruceBanner

I am a lazy b****
I debug old school quite a lot and usually end up typing this pattern over and over:  
```ruby
puts '*' * 40
puts "thing: #{thing}"
```

Since my laziness knows no bounds I wrote this gem so I can type stuff like this instead:

```ruby
bb thing
```

Also a few other pretty printing/debug gems were a bit overkill...but still very nice ;)  
Even more importantly, it's really all about the name...

## Usage

in irb:

```ruby
require 'bruce-banner'

# NOTE: if sticking a Hash directly in the call you may need the parens
bb({one:1, two:2}) # or h = {one:1, two:2}; bb h 

# output with the default settings
------------------
{:one=>1, :two=>2}
```

Even better magic shamelessy stolen from Jim Weirich.  
You pass a *block* wrapping the name of a variable *(as a symbol)* and it will print the name and the value.

```ruby
magic = "this is voodoo magic!"
bb {:magic} 

# outputs
----------------------------
magic: this is voodoo magic!

# NOTE: passing the block overrides any passed in value but will pick up defaults
that_whiny_girl_from_highschool = "no one pays any attention to me!"
bb(that_whiny_girl_from_highschool, after:true) {:magic}

# outputs
----------------------------
magic: this is voodoo magic!
----------------------------

# Really you can just invoke the method like this:
# forgetting all about that girl from high school

bb(after:true) {:magic}

# and it sill outputs
----------------------------
magic: this is voodoo magic!
----------------------------
```

## Configuration Options

`:count`  set the size of the banner string. Will be overridden if `size_to_fit` is true.  
`:string` set the string to be repeated as the banner. Default is `'-'`  
`:before` print the banner string before the payload? Defaults is `true`  
`:after`  print the banner string after the payload?  Defaults is `false`  
`:size_to_fit` counts the size of the payload string and uses that value as the banner size. Default is `true`. Will override `count` if set to `true`.

```ruby
BruceBanner.configuration do |defaults_hash|
    defaults_hash[:count] = 60
    defaults_hash[:size_to_fit] = false
end
```

You can also override the defaults on a per call basis:

```ruby
bb({one:1, two:2}, after:true, string:'*')

# outputs
******************
{:one=>1, :two=>2}
******************
```

## And just for fun!

```ruby
BruceBanner.make_him_angry! #=> find out for yourself ;)
```

## Installation

Add this line to your application's Gemfile:

    gem 'bruce-banner'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bruce-banner


## TODO

make the output string more configurable, possibly allow creation of a message template.  
i.e. 
```ruby
BruceBanner.template = "%s: %s"
bb("thing", 1432) #=> thing: 1432
```



