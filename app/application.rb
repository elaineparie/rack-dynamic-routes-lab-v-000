
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      search_term = req.params["item_name"]
      if @@items.include?(search_term)
        resp.write "#{Item.price}"
      else
        resp.write "Item not found"
     resp.status = 400
      end
    else
     resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
