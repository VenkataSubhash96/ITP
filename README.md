# Itp

Itp gem helps you to transfer files from system to system. You can share a file to your colleague very easily. It uses ipfs-ruby gem for seting up ipfs client and contacting ipfs server.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'itp'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itp

## Usage

This gem supports only CLI.

To share a file to your colleague, you have to add it to ipfs daemon server. To do that, there should be a ipfs daemon server running. By default, ipfs daemon server runs in the port 5001. This gem expects an ipfs daemon server to be running in the port 5001.

To run ipfs daemon server, you have to do the following.

    $ ipfs daemon

This would start an ipfs daemon server at port 5001.

Now, an ipfs daemon server is running at port 5001 and is ready to accept file sharings. Now your job is pretty easy now. You can share any file with your colleague. To share a file, you have to do the following from your console.

    $ ruby -Ilib ./bin/itp share filename

This would generate a hash which you should be sending to your friend. What your friend must be doing with the hash will be explained later. So, this would internally add your file to ipfs daemon server.

Now, the time has come for your friend to receive that file using the hash generated. To receive the file, type the following command from your console.

    $ ruby -Ilib ./bin/itp receive hashcode

This would create a file with name received.txt in the current directory.

So this way, files are shared among systems.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/VenkataSubhash96/itp. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

