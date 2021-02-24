require 'net/http' #We require it at the top of our file 
require 'open-uri' #require the URI library which helps Ruby to handle URIs.
require 'json'
 
class GetPrograms
 
  URL = "http://data.cityofnewyork.us/resource/uvks-tn5n.json" #We stored our API endpoint URL in a constant at the top of our class. 
 
  def get_programs
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)  #we have a get_programs method that uses the NET::HTTP library to send an HTTP request from our program.
    response.body
   def program_school #just getting the respnse body from the requested URL so we could name this 'get_response_body' to be more accurate.  Can replace with method with Parse_json method as well.  
    programs = JSON.parse(self.get_programs)
    programs.collect do |program|
      program["agency"]  
    end
  end
 
end
 
# programs = GetPrograms.new.get_programs
# puts programs

programs = GetPrograms.new
puts programs.program_school.uniq