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
  fetch(`https://localhost:3000/api/v1/events?limit=25&latitude=${latitude}&longitude=${longitude}&price=1`, { // Change the port to 3000
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': document.querySelector("meta[name='csrf-token']").getAttribute("content")
    },
    body: JSON.stringify({ location: { latitude, longitude } })
  })
  .then(response => response.json())
  .then(data => console.log('Success:', data))
  .catch(error => console.error('Error:', error));
}
