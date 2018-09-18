require 'ipfs/client'

class Itp
  def self.ipfs_client
    IPFS::Client.default
  end

  def self.add_file(file_name)
    link = ipfs_client.add(file_name)
    link.hashcode
  rescue HTTP::ConnectionError
    "Cannot Add file. IPFS daemon server not running. Run 'ipfs daemon'"
  end

  def self.view_content(hash_code)
    ipfs_client.cat(hash_code)
  rescue HTTP::ConnectionError
    "Cannot receive file. IPFS daemon server not running. Run 'ipfs daemon'"
  end
end
