require_relative "./item.rb"
class Application

  @@items = Item.all

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items").last
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
