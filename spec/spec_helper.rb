$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$:.unshift(File.dirname(__FILE__))

%w(rubygems rack rack/test rack/var_dump rspec).each {|f| require f}

DummyBody = <<-EOH
<html>
  <head></head>
    <body>
      <p>Dummy Rack!</p>
    </body>
  </html>
EOH

class TestRackApp
  def call(env)
    case env['PATH_INFO']
    when '/'
      [200, {"Content-Type" => "text/html"}, [DummyBody]]
    when '/image.jpg'
      [200, {"Content-Type" => "image/ipg"}, [DummyBody]]
    end
  end
end

