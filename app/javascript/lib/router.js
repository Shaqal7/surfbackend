import { renderTideChart } from '../lib/tideChart'
import Tide from '../lib/tide'
import { renderChart, waveChart, options } from '../lib/waveChart'

export function router() {
  var location_path = event.currentTarget.location.pathname 
  switch(location_path) {
    case '/':
        containerStyle();
        setLocation()
        break;
    case '/posts':
    case '/users/sign_in':
    case '/users/sign_up':
        getLocation();
        break;
  }

  if (location_path.match(/posts\/[0-9][0-9]/)) { 
    var tides = $('#forecast-data').data('tides')
    var dates = $('#forecast-data').data('dates')
    var tideData = $('#forecast-data').data('tide')['extremes']
    var $tideTable = $('#tideTable')
    console.log($tideTable[0].childElementCount)
    if ($tideTable[0].childElementCount == 0) { appendTideData(tideData, $tideTable) }
    var times = dates.map((time) => new Date(time).getHours())
    renderTideChart(tides, times) 
    renderChart()
  }
}

function appendTideData(data, $target) {
  Object.keys(data).forEach(function(key) {
    var tide = new Tide(data[key])
    $target.append(tide.row)
  });
}
