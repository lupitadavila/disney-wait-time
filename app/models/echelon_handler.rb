require 'echelon'


module EchelonHandler

  $wdw = Echelon::DisneyWorld.new

  def self.search(query)
    results = $wdw.magic_kingdom.ride_list.values.grep /query/i

    if results.length = 1
        ride = $wdw.magic_kingdom.find_by_name(results.first)
        return ride
    end
    return results
  end

end
