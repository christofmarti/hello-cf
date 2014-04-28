require "sinatra/base"
require "json"

module App
  class Main < Sinatra::Base

    configure do
      enable :logging
      set :raise_errors, true
    end

    before do
      logger.datetime_format = "%Y/%m/%d @ %H:%M:%S "
      logger.level = Logger::INFO
    end

    get '/' do
      logger.debug "debug message"
      logger.info "info message"
      port = ENV['VCAP_APP_PORT']
      appinfo = JSON.pretty_unparse(JSON.parse(ENV['VCAP_APPLICATION']))
      rurl = request.url
      "\n<h1>Hello World 2014 from port #{port}</h1>\n<pre>#{appinfo}</pre>\n"
    end

    get "/broken" do
      logger.debug "trying broken service"
      `ps -AF | grep -m1 "ruby" | awk '{print $2;}' | (read pid; kill $pid)`
    end
    
    get "/systemcrash" do
      logger.debug "trying broken service"
      Kernel.exit!
    end
    run!
  end

end

