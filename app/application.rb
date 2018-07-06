class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path== "/items"
      search_term = req.params["item"]
      if @@items.include?(search_term)
        item.price
      else
      resp.status = 404
    end  
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
