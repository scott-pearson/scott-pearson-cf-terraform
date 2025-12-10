export default {
  async fetch(request) {
    /**
     * Replace `remote` with the host you wish to send requests to
     */
    const remote = "https://scottpearson.website/headers.php";

    // 1. Retrieve the CF-RAY from the incoming request (Added the missing / here)
    const rayId = request.headers.get("cf-ray");

    // 2. Create a new Request object based on the original.
    const newRequest = new Request(remote, request);

    // 3. Set the custom 'parent-ray' header on the NEW request
    if (rayId) {
      newRequest.headers.set("parent-ray", rayId);
    }

    // 4. Fetch using the modified request object
    return await fetch(newRequest);
  },
};
