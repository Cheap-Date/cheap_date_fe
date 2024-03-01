document.addEventListener('DOMContentLoaded', () => {
  const getLocationButton = document.getElementById('get-location');
  getLocationButton.addEventListener('click', () => {
    if ("geolocation" in navigator) {
      navigator.geolocation.getCurrentPosition(position => {
        const { latitude, longitude } = position.coords;
        sendDataToServer(latitude, longitude);
      });
    } else {
      alert("Geolocation is not supported by your browser.");
    }
  });
});

function sendDataToServer(latitude, longitude) {
  fetch(`http://localhost.com:3000/api/v1/events?start_date=${Time.now.to_i}&limit=25&latitude=${latitude}&longitude=${longitude}&price=1&radius=40000`, { // Change the port to 3000
    method: 'GET',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': document.querySelector("meta[name='csrf-token']").getAttribute("content")
    }
  })
  .then(response => response.json())
  .then(data => console.log('Success:', data))
  .catch(error => console.error('Error:', error));
}
