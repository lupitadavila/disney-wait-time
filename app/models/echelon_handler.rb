require 'echelon'


module EchelonHandler

  $wdw = Echelon::DisneyWorld.new

  def self.search(query)
    p "THE QUERY: " + query
    results = $wdw.magic_kingdom.ride_list.values.grep /#{query}/i
    if results.length >= 1
      message = ""
      for result in results
        ride = $wdw.magic_kingdom.find_by_name(result)
        message += "#{ride.name} has a wait time of #{ride.queue_time} minutes.\n"
      end
    else
      message = "Couldn't recognize: #{query}. Please try again"
    end
    message
  end

end
