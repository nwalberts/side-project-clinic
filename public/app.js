
let giphyRequest = (query) => {
  fetch(`http://api.giphy.com/v1/gifs/search?q=${query}&api_key=samprs7x2dZeRpIQQ8C0ARQta1nffdFC`)
  .then(response => {
    if (response.ok) {
      return response;
    } else {
      let errorMessage = `${response.status} (${response.statusText})`,
      error = new Error(errorMessage);
      throw(error);
    }
  })
  .then(response => response.text())
  .then(body => {
    debugger
    let bodyParsed = JSON.parse(body);
    let firstImage = bodyParsed.data[0].images.fixed_height.url

    document.getElementById("gif").src=firstImage;
  })
  .catch(error => console.error(`Error in fetch: ${error.message}`));
}

giphyRequest("steven-universe")
