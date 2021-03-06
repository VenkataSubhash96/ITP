require 'ipfs/client'

class Itp
  def self.ipfs_client
    IPFS::Client.default
  end

  def self.share_file(file_name)
    link = ipfs_client.add(file_name)
    link.hashcode
  rescue HTTP::ConnectionError
    "Cannot Add file. IPFS daemon server not running. Run 'ipfs daemon'. Make sure you have ipfs gem installed."
  end

  def self.receive_file(hash_code)
    content = ipfs_client.cat(hash_code)
    File.open('received.txt', 'w') do |output_file|
      output_file.write(content)
    end
    'Received file'
  rescue HTTP::ConnectionError
    "Cannot receive file. IPFS daemon server not running. Run 'ipfs daemon'. Make sure you have ipfs gem installed."
  end
end
