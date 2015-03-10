class DummyClass
  %i(get post put patch delete).each do |method|
    define_method(method) do |path, body={}|
      true
    end
  end
end
