class ApplicationController < ActionController::API
  def log_everything
    puts "---"
    ap "#{request.method} request: #{"#{request.protocol}#{request.host_with_port}#{request.fullpath}"}"

    puts "Params:"
    ap request.params

    puts "Headers:"
    ap request.env.select {|k,v| k.match("^HTTP.*")}

    puts "Body:"
    ap JSON.parse(request.body.read)
    puts "---"
  end
end
