
require 'nokogiri'

begin
    file = File.open('hello.xml')
    if file
        @doc = Nokogiri::XML(file)
        a = @doc.xpath("//test/note[1]/body")
        puts a
    end
rescue Exception => e
    puts e
    puts e.backtrace
end