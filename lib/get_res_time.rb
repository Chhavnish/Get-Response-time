require "get_res_time/version"
require 'net/http'
require 'uri'

module GetResTime
    def ping(host)
    begin
      url = URI.parse(host)
      start_time = Time.now
      response = Net::HTTP.get(url)
      end_time = Time.now - start_time

      if response==""
        return false
      else
        puts "response time : #{end_time}"
        return true
      end

    rescue Errno::ECONNREFUSED
      return false
    end
  end

ping "https://gitlab.com"
end
