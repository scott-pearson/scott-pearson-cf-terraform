export default {
  async fetch(request) {
    /**
     * Replace `remote` with the host you wish to send requests to
     */
    const remote = "https://scottpearson.website/headers.php";

    return await fetch(remote, request);
  },
};
