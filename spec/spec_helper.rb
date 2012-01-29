$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$:.unshift(File.dirname(__FILE__))

%w(rubygems rack rack/test rack/var_dump rspec).each {|f| require f}

class TestRackApp
  DummyBody = <<-EOH
  <html>
    <head></head>
      <body>
        <p>Dummy Rack!"</p>
      </body>
    </html>
  EOH

  def call(env)
    case env['PATH_INFO']
    when '/'
      [200, {"Content-Type" => "text/html"}, [DummyBody]]
    when '/404'
      [404, {"Content-Type" => "image/ipg"}, [DummyBody]]
    when '/image.jpg'
      [200, {"Content-Type" => "image/ipg"}, [DummyBody]]
    end
  end
end

