class ApplicationController < ActionController::API
  def log_everything
    puts "---"
    ap "#{request.method} request: #{"#{request.protocol}#{request.host_with_port}#{request.fullpath}"}"

    puts "Params:"
    ap request.params

    puts "Headers:"
    ap request.env.select {|k,v| k.match("^HTTP.*")}

    puts "Body:"
    begin
      ap JSON.parse(request.body.read)
    rescue JSON::ParserError
      puts "Not a JSON body.. but here it is:"
      ap request.body.read
    end
    puts "---"

    render :ok
  end
end
