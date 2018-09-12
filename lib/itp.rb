# require 'itp/version'
require 'ipfs/client'

class Itp
  def self.generate_hash
    puts 'Generated Hash!'
  end

  def self.ipfs_client
    IPFS::Client.default
  end

  def self.add_file(file_name)
    link = ipfs_client.add(file_name)
    link.hashcode
  end
end
